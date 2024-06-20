<?php
namespace App\Model\Entity;

use Cake\ORM\Entity;

/**
 * ExcelImported Entity
 *
 * @property int $id
 * @property string $nom
 * @property string $nom_excel
 * @property string|null $message
 * @property int $nombre_ligne
 * @property int $num_ligne_imported
 * @property string|null $status
 * @property \Cake\I18n\FrozenDate $created
 * @property \Cake\I18n\FrozenDate $modified
 *
 * @property \App\Model\Entity\Messagery[] $messageries
 */
class ExcelImported extends Entity
{
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
        'nom' => true,
        'nom_excel' => true,
        'message' => true,
        'nombre_ligne' => true,
        'num_ligne_imported' => true,
        'status' => true,
        'created' => true,
        'modified' => true,
        'messageries' => true,
    ];
}
