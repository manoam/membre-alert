<?php
declare(strict_types=1);

namespace App\Controller;

use Cake\Core\Configure;

/**
 * Messageries Controller
 *
 * @property \App\Model\Table\MessageriesTable $Messageries
 * @method \App\Model\Entity\Messagery[]|\Cake\Datasource\ResultSetInterface paginate($object = null, array $settings = [])
 */
class MessageriesController extends AppController
{
    
    /**
     * Détermine si l'utilisateur spécifié est autorisé
     *
     * @param User $user : L'utilisateur
     * @return boolean Vrais si l'utilisateur spécifié est autorisé, Faux dans le cas contraire
     */
    public function isAuthorized($user)
    {
        if ($user) {
            return true;
        }
        return parent::isAuthorized($user);
    }
    
    
    /**
     * Index method
     *
     * @return \Cake\Http\Response|null|void Renders view
     */
    public function index($isEnvoye = false)
    {
        $options = $this->request->getQuery();
        $options['type'] = 'sent';
        $messageries = $this->Messageries->find('complet', $options)->contain(['ExcelImporteds', 'Users'])->order(['Messageries.id' => 'DESC']);
        if ($isEnvoye) {
            $messageries->where(['Messageries.status' => 'envoye']);
        } else {
            $messageries->where(['Messageries.status <>' => 'envoye']);
        }
        $messageries = $this->paginate($messageries);
        $status = Configure::read('message_status');
        $excels = $this->Messageries->ExcelImporteds->find('list');
        $users  = $this->Messageries->Users->find('list');

        $this->set(compact('messageries', 'status', 'options', 'excels', 'users', 'isEnvoye'));
    }

    
    /**
     * Liste des message reçu dans le modem
     *
     * @return \Cake\Http\Response|null|void Renders view
     */
    public function receved()
    {
        $options = $this->request->getQuery();
        $options['type'] = 'receve';
        $messageries = $this->Messageries->find('complet', $options)->order(['Messageries.id' => 'DESC']);
        $messageries = $this->paginate($messageries);
        $status = Configure::read('message_status');
        $users  = $this->Messageries->Users->find('list');

        $this->set(compact('messageries', 'status', 'options', 'users'));
    }
    
    /**
     * View method
     *
     * @param string|null $id Messagery id.
     * @return \Cake\Http\Response|null|void Renders view
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $messagery = $this->Messageries->get($id, [
            'contain' => ['ExcelImporteds'],
        ]);

        $this->set(compact('messagery'));
    }

    /**
     * Add method
     *
     * @return \Cake\Http\Response|null|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
        $messagery = $this->Messageries->newEmptyEntity();
        if ($this->request->is('post')) {
            $messagery = $this->Messageries->patchEntity($messagery, $this->request->getData());
            if ($this->Messageries->save($messagery)) {
                $this->Flash->success(__('The messagery has been saved.'));

                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The messagery could not be saved. Please, try again.'));
        }
        $excelImporteds = $this->Messageries->ExcelImporteds->find('list', ['limit' => 200])->all();
        $this->set(compact('messagery', 'excelImporteds'));
    }

    /**
     * Edit method
     *
     * @param string|null $id Messagery id.
     * @return \Cake\Http\Response|null|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $messagery = $this->Messageries->get($id, [
            'contain' => [],
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $messagery = $this->Messageries->patchEntity($messagery, $this->request->getData());
            if ($this->Messageries->save($messagery)) {
                $this->Flash->success(__('The messagery has been saved.'));

                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The messagery could not be saved. Please, try again.'));
        }
        $excelImporteds = $this->Messageries->ExcelImporteds->find('list', ['limit' => 200])->all();
        $this->set(compact('messagery', 'excelImporteds'));
    }

    /**
     * Delete method
     *
     * @param string|null $id Messagery id.
     * @return \Cake\Http\Response|null|void Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $messagery = $this->Messageries->get($id);
        if ($this->Messageries->delete($messagery)) {
            $this->Flash->success(__('The messagery has been deleted.'));
        } else {
            $this->Flash->error(__('The messagery could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
    
    
    /**
     * On a fait un modal pour regarder et envoyer un message à un destinataire.
     * Et cette fonction permet d'afficher les messages sur une destinataire.
     * 
     * @param type $destinataire
     */
    public function listMessage($destinataire) 
    {
        $messages = [];
        if ($destinataire) {
            $messages = $this->Messageries->findByDestinataire($destinataire)->toArray();
        }
        
        $this->set(compact('messages'));
    }
    
    
    /**
     * Suit à la fonction "listMessage", mais ça envoi le message.
     * 
     * @return type
     */
    public function sendMessage() 
    {
        $response['succes'] = 0;
        if ($this->request->is(['post', 'put'])) {
            
            $data = $this->request->getData();
            
            $status = $this->Modem->smssend($data['destinataire'], $data['message']);

            $dataMessage = [
                'excel_imported_id' => null,
                'message'           => $data['message'],
                'destinataire'      => $data['destinataire'],
                'status'            => $status ? 'envoye' : 'non_envoye',
            ];

            $messagery = $this->Messageries->newEntity($dataMessage);
            $this->Messageries->save($messagery);
            $response['succes'] = 1;
        }
        
        return $this->response->withType('application/json')->withStringBody(json_encode($response));
    }
    
    /**
     * Read message dans le box et enregistrer dans la base de donnée.
     * delete le message enregistrer.
     * 
     */
    function readMessage() 
    {
        $messages = $this->Modem->smsread();
        
        foreach ($messages->Message as $message) {
            $message->Index;
            
            $dataMessage = [
                'excel_imported_id' => null,
                'message'           => $message->message,
            ];

            $messagery = $this->Messageries->newEntity($dataMessage);
            if ($this->Messageries->save($messagery)) {
                
                $this->Modem->smsdelete($messagery->Index);
            }
            
        }
        
    }
    
}
