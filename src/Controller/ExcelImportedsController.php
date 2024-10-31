<?php

declare(strict_types=1);

namespace App\Controller;

use Cake\Utility\Text;
use App\Model\Entity\Messagery;
use Cake\Core\Configure;

/**
 * ExcelImporteds Controller
 *
 * @property \App\Model\Table\ExcelImportedsTable $ExcelImporteds
 * @method \App\Model\Entity\ExcelImported[]|\Cake\Datasource\ResultSetInterface paginate($object = null, array $settings = [])
 */
class ExcelImportedsController extends AppController {

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
    public function index() {
                
        $status = Configure::read('excel_status');
        
        $excelImporteds = $this->paginate($this->ExcelImporteds->find('all')->contain(['Users']), ['limit' => 10]);

        $this->set(compact('excelImporteds', 'status'));
    }

    /**
     * View method
     *
     * @param string|null $id Excel Imported id.
     * @return \Cake\Http\Response|null|void Renders view
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null) {
        $excelImported = $this->ExcelImporteds->get($id, [
            'contain' => [],
        ]);

        $this->set(compact('excelImported'));
    }

    /**
     * Add method
     *
     * @return \Cake\Http\Response|null|void Redirects on successful add, renders view otherwise.
     */
    public function add() {
        $this->loadComponent('SpreadSheet');

        $excelImported = $this->ExcelImporteds->newEntity();
        if ($this->request->is('post')) {

            $data = $this->request->getData();
            $newName = $this->uploadFile($data["excel"], ['xlsx'], PATH_EXCEL);

            debug($newName);
            if ($newName) {

                $data['nombre_ligne'] = $this->SpreadSheet->countLigne(PATH_EXCEL . $newName);
                $data['nom_excel'] = $newName;
                $data['status'] = 'enregister';

                $excelImported = $this->ExcelImporteds->patchEntity($excelImported, $data);
                if ($this->ExcelImporteds->save($excelImported)) {

                    $this->Flash->success("L'import excel est bien sauvegardé");

                    return $this->redirect(['action' => 'importAndSendSms', $excelImported->id]);
                }
                debug($excelImported->getErrors());
            }
            die;
            $this->Flash->error("L'import excel n'a pas pu sauvegardé, Veuillez reessayer svp.");
        }
        $this->set(compact('excelImported'));
    }

    /**
     * Edit method
     *
     * @param string|null $id Excel Imported id.
     * @return \Cake\Http\Response|null|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function editExcel($id = null) {
        $response = ['succes' => 0];
        $excelImported = $this->ExcelImporteds->get($id, [
            'contain' => [],
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $excelImported = $this->ExcelImporteds->patchEntity($excelImported, $this->request->getData());
            if ($this->ExcelImporteds->save($excelImported)) {
                
                return $this->response->withType('application/json')->withStringBody(json_encode(['succes' => 1]));
            }
        }
        return $this->response->withType('application/json')->withStringBody(json_encode($response));
    }

    /**
     * Delete method
     *
     * @param string|null $id Excel Imported id.
     * @return \Cake\Http\Response|null|void Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null) {
        $this->request->allowMethod(['post', 'delete']);
        $excelImported = $this->ExcelImporteds->get($id);
        if ($this->ExcelImporteds->delete($excelImported)) {
            $this->Flash->success(__('The excel imported has been deleted.'));
        } else {
            $this->Flash->error(__('The excel imported could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }

    public function uploadFile($tmpFile, $extensions, $path) {
        try {
            if ($tmpFile && $tmpFile['tmp_name']) {
                $fileName = $tmpFile['name'];
                $infoFile = pathinfo($fileName);
                $fileExtension = strtolower($infoFile["extension"]);

                if (in_array($fileExtension, $extensions)) {
                    $newName = Text::uuid() . '.' . $fileExtension;
                    $destinationFileName = $path . $newName;

                    if (move_uploaded_file($tmpFile['tmp_name'], $destinationFileName)) {

                        return $newName;
                    }
                }
            }

            return false;
        } catch (\Exception $e) {

            $this->Flash->error($e->getMessage());
            return false;
        }
    }

    public function importAndSendSms($excelImportedId) {
        $excelImported = $this->ExcelImporteds->findById($excelImportedId)->first();
        if ( ! $excelImported || $excelImported->num_ligne_imported >= $excelImported->nombre_ligne) {

            $this->Flash->error('Toutes les lignes sont traitées');
            $this->redirect(['action' => 'index']);
        }
        $this->set(compact('excelImported', 'excelImportedId'));
    }

    public function traitementParLigne($excelImportedId, $numLigne = 2) 
    {
        $response = ['succes' => 0];
        $this->loadComponent('SpreadSheet');
        $excelImported = $this->ExcelImporteds->findById($excelImportedId)->first();
        
        if ($excelImported && $numLigne <= $excelImported->nombre_ligne) {
            $datas = $this->SpreadSheet->read(PATH_EXCEL . $excelImported->nom_excel, $numLigne);
            $message = $excelImported->message;
            $destinataire = null;

            if (count($datas)) {
                
                $destinataire = $datas['A'];
                
                foreach ($datas as $colomne => $value) {
                    $message = str_replace('#'.$colomne, $value, $message);
                }
            }
            
            if ($destinataire) {
                $status = $this->Modem->smssend($destinataire, $message);
                $this->saveNewMessageries($excelImported, $destinataire, $message, $status, $numLigne);
            }
            
            $rapport = $numLigne * 100 / $excelImported->nombre_ligne;
            
            $response = [
                'succes'        => 1,
                'rapport'       => (int) $rapport,
                'status'        => $status ? 'envoye' : 'non_envoye',
                'message'       => "Message " . ($status ? 'envoyé' : 'non envoyé') . " au " . $destinataire,
            ];
        }
        
        return $this->response->withType('application/json')->withStringBody(json_encode($response));
    }
    
    public function saveNewMessageries($excelImported, $destinataire, $message, $status, $numLigne) 
    {
        $this->loadModel('Messageries');
        $data = [
            'excel_imported_id' => $excelImported->id,
            'message'           => $message,
            'destinataire'      => $destinataire,
            'status'            => $status ? 'envoye' : 'non_envoye',
        ];
        
        $messagery = new Messagery($data);
        $this->Messageries->save($messagery);
        /*
         * A chaque traitement ligne, faut modifier le excelImported
         */
        $excelImported->num_ligne_imported = $numLigne;
        $this->ExcelImporteds->save($excelImported);
        
    }
    
    public function testDelete() {
        $sms = $this->Modem->smsread(2);
        $index = [];
        foreach ($sms->Message as $s) {
            $index[] = $s->Index;
        }
        $this->Modem->smsdelete($index);
        die;
    }

}
