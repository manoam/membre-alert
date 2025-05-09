<?php
namespace App\Model\Entity;

use Cake\ORM\Entity;
use Cake\Auth\DefaultPasswordHasher;
use Cake\Routing\Router;

/**
 * User Entity
 *
 * @property int $id
 * @property string $email
 * @property string $password
 * @property string|null $nom
 * @property string|null $prenom
 * @property \Cake\I18n\FrozenDate $created
 * @property \Cake\I18n\FrozenDate $modified
 */
class User extends Entity
{
    
    protected $_virtual = ['full_name', 'url_photo'];
    
    /**
     * Fields that can be mass assigned using newEntity() or patchEntity().
     *
     * Note that when '*' is set to true, this allows all unspecified fields to
     * be mass assigned. For security purposes, it is advised to set '*' to false
     * (or remove it), and explicitly make individual fields accessible as needed.
     *
     * @var array
     */
    protected $_accessible = [
        'id' => false,
        '*' => true
    ];

    /**
     * Fields that are excluded from JSON versions of the entity.
     *
     * @var array
     */
    protected $_hidden = [
        'password',
    ];
    
    
    protected function _setPassword($value)
    {
        if (strlen($value)) {
            $hasher = new DefaultPasswordHasher();

            return $hasher->hash($value);
        }
    }

    
    protected function _getFullName() {
        return $this->nom . ' ' . $this->prenom;
    }
    
    
    protected function _getUrlPhoto()
    {
        $url = Router::url('/', true)."img/users/default_photo_user.jpg";
        $filename = $this->photo_nom;

        if (!empty($filename) && file_exists(PATH_PHOTO_USER . $filename)) {
            $url = Router::url('/', true)."uploads/contacts/".$filename;
        }
        return $url;
    }

}
