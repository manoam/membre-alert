<?php
/**
 * CakePHP(tm) : Rapid Development Framework (https://cakephp.org)
 * Copyright (c) Cake Software Foundation, Inc. (https://cakefoundation.org)
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright Copyright (c) Cake Software Foundation, Inc. (https://cakefoundation.org)
 * @link      https://cakephp.org CakePHP(tm) Project
 * @since     0.2.9
 * @license   https://opensource.org/licenses/mit-license.php MIT License
 */
namespace App\Controller;

use Cake\Controller\Controller;
use Cake\Event\Event;

/**
 * Application Controller
 *
 * Add your application-wide methods in the class below, your controllers
 * will inherit them.
 *
 * @link https://book.cakephp.org/3.0/en/controllers.html#the-app-controller
 */
class AppController extends Controller
{

    /**
     * Initialization hook method.
     *
     * Use this method to add common initialization code like loading components.
     *
     * e.g. `$this->loadComponent('Security');`
     *
     * @return void
     */
    public function initialize()
    {
        parent::initialize();

        $this->loadComponent('RequestHandler', [
            'enableBeforeRedirect' => false,
        ]);
        
        $this->loadComponent('Modem', ['password' => 'admin']);
        
        $this->loadComponent('Flash');

        /*
         * Enable the following component for recommended CakePHP security settings.
         * see https://book.cakephp.org/3.0/en/controllers/components/security.html
         */
        //$this->loadComponent('Security');
        
        
        /*
         * Enable the following components for recommended CakePHP security settings.
         * see https://book.cakephp.org/3.0/en/controllers/components/security.html
         */
        $this->loadComponent('Auth', [
            'authorize'=> 'Controller',
            'authenticate' => [
                'Form' => [
                    'fields' => [
                        'username' => 'email',
                        'password' => 'password'
                    ]
                ]
            ],
            'loginAction' => [
                'controller' => 'Users',
                'action' => 'login'
            ],
             'loginRedirect' => [
                'controller' => 'Users',
                'action' => 'redirecting'  // redirecting if success
            ],
             // Si pas autorisé, on renvoit sur la page précédente
            'unauthorizedRedirect' => true,
            'authError' => "Vous n’êtes pas autorisé à accéder à cette page."
        ]);
        
        $this->allowAction = ['traitementParLigne', 'editExcel'];
        $this->Auth->allow($this->allowAction);
        
        $userConnected = $this->currentUser();
        $isOnlineModem = $this->Modem->GSMNetwork();
        $this->set(compact('userConnected', 'isOnlineModem'));

    }
    
    
    public function isAuthorized($user)
    {
        $action = $this->request->getParam('action');
        // authentifiés sur l'application
        if (in_array($action, $this->allowAction)) {
            return true;
        }
        // Par défaut, on refuse l'accés.
        return false;
    }
    
    
    public function currentUser($id = null)
    {
        $this->loadModel('Users');
        $currentAuthID = $this->request->getSession()->read('Auth.User.id');
        $currentUser = is_null($id) 
            ? ($this->Users->find()->where(['id' => $currentAuthID])->first())
            : ($this->Users->find()->where(['id' => $id])->first());
        
        unset($currentUser->password);
        return $currentUser;
    }
}
