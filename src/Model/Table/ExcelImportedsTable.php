<?php
namespace App\Model\Table;

use Cake\ORM\Table;
use Cake\Validation\Validator;
use Cake\Network\Session;

/**
 * ExcelImporteds Model
 *
 * @property \App\Model\Table\MessageriesTable&\Cake\ORM\Association\HasMany $Messageries
 *
 * @method \App\Model\Entity\ExcelImported get($primaryKey, $options = [])
 * @method \App\Model\Entity\ExcelImported newEntity($data = null, array $options = [])
 * @method \App\Model\Entity\ExcelImported[] newEntities(array $data, array $options = [])
 * @method \App\Model\Entity\ExcelImported|false save(\Cake\Datasource\EntityInterface $entity, $options = [])
 * @method \App\Model\Entity\ExcelImported saveOrFail(\Cake\Datasource\EntityInterface $entity, $options = [])
 * @method \App\Model\Entity\ExcelImported patchEntity(\Cake\Datasource\EntityInterface $entity, array $data, array $options = [])
 * @method \App\Model\Entity\ExcelImported[] patchEntities($entities, array $data, array $options = [])
 * @method \App\Model\Entity\ExcelImported findOrCreate($search, callable $callback = null, $options = [])
 *
 * @mixin \Cake\ORM\Behavior\TimestampBehavior
 */
class ExcelImportedsTable extends Table
{
    /**
     * Initialize method
     *
     * @param array $config The configuration for the Table.
     * @return void
     */
    public function initialize(array $config)
    {
        parent::initialize($config);

        $this->setTable('excel_importeds');
        $this->setDisplayField('nom');
        $this->setPrimaryKey('id');

        $this->addBehavior('Timestamp');

        $this->hasMany('Messageries', [
            'foreignKey' => 'excel_imported_id',
        ]);
        
        $this->belongsTo('Users', [
            'foreignKey' => 'user_id',
            'joinType' => 'LEFT',
        ]);
    }

    /**
     * Default validation rules.
     *
     * @param \Cake\Validation\Validator $validator Validator instance.
     * @return \Cake\Validation\Validator
     */
    public function validationDefault(Validator $validator)
    {
        $validator
            ->integer('id')
            ->allowEmptyString('id', null, 'create');

        $validator
            ->scalar('nom')
            ->maxLength('nom', 255)
            ->requirePresence('nom', 'create')
            ->notEmptyString('nom');

        $validator
            ->scalar('nom_excel')
            ->maxLength('nom_excel', 255)
            ->requirePresence('nom_excel', 'create')
            ->notEmptyString('nom_excel');

        $validator
            ->scalar('message')
            ->allowEmptyString('message');

        $validator
            ->integer('nombre_ligne')
            ->notEmptyString('nombre_ligne');

        $validator
            ->integer('num_ligne_imported')
            ->notEmptyString('num_ligne_imported');

        $validator
            ->scalar('status')
            ->allowEmptyString('status');

        return $validator;
    }
    
    
    /**
     * beforeSave callback
     *
     * @param $options array
     * @return boolean
     */
    public function beforeSave($event, $entity, $options) {
        
        if ($entity->isNew()) {
            $entity->status  = "enregistrer";
            $entity->user_id = (new Session)->read('Auth.User.id') ? : 0;
        }
    }
    
}
