<?php
namespace App\Model\Entity;

use Cake\ORM\Entity;

/**
 * Messagery Entity
 *
 * @property int $id
 * @property int $excel_imported_id
 * @property string|null $message
 * @property string $destinataire
 * @property string $status
 * @property \Cake\I18n\FrozenDate $created
 * @property \Cake\I18n\FrozenDate $modified
 *
 * @property \App\Model\Entity\ExcelImported $excel_imported
 */
class Messagery extends Entity
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
        'excel_imported_id' => true,
        'message' => true,
        'destinataire' => true,
        'status' => true,
        'created' => true,
        'modified' => true,
        'excel_imported' => true,
    ];
}
