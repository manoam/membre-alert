<?php

namespace App\Controller;

use App\Controller\AppController;

/**
 * Users Controller
 *
 * @property \App\Model\Table\UsersTable $Users
 *
 * @method \App\Model\Entity\User[]|\Cake\Datasource\ResultSetInterface paginate($object = null, array $settings = [])
 */
class UsersController extends AppController {

    
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
     * @return \Cake\Http\Response|null
     */
    public function index() {
        $users = $this->paginate($this->Users);

        $this->set(compact('users'));
    }

    /**
     * View method
     *
     * @param string|null $id User id.
     * @return \Cake\Http\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null) {
        
        $this->viewBuilder()->setLayout('users');
        
        $user = $this->Users->get($id, [
            'contain' => [],
        ]);
        
        if ($this->request->is(['patch', 'post', 'put'])) {
            $user = $this->Users->patchEntity($user, $this->request->getData());
            if ($this->Users->save($user)) {
                $this->Flash->success(__('The user has been saved.'));

                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The user could not be saved. Please, try again.'));
        }

        $this->set('user', $user);
    }

    /**
     * Delete method
     *
     * @param string|null $id User id.
     * @return \Cake\Http\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null) {
        $this->request->allowMethod(['post', 'delete']);
        $user = $this->Users->get($id);
        if ($this->Users->delete($user)) {
            $this->Flash->success(__('The user has been deleted.'));
        } else {
            $this->Flash->error(__('The user could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }

    public function login() 
    {
        
        if ($this->currentUser()) {
            
            $this->redirecting();
        } 
        
        $this->viewBuilder()->setLayout('login');
        if ($this->request->is('post')) {
            $user = $this->Auth->identify();
            if ($user) {

                $this->Auth->setUser($user);
                $this->redirecting();
            } else {
                $this->Flash->error(__("Username or password incorrect"));
            }
        }
    }
    
    
    public function redirecting() 
    {
        $default = $this->Auth->redirectUrl();

        if ($default != '/users/redirecting') {
            return $this->redirect($default);
        }

        return $this->redirect(['controller' => 'ExcelImporteds', 'action' => 'index']);
    }
    

}
