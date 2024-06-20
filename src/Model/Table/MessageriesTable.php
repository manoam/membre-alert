<?php
namespace App\Model\Table;

use Cake\ORM\Query;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;
use Cake\Network\Session;

/**
 * Messageries Model
 *
 * @property \App\Model\Table\ExcelImportedsTable&\Cake\ORM\Association\BelongsTo $ExcelImporteds
 *
 * @method \App\Model\Entity\Messagery get($primaryKey, $options = [])
 * @method \App\Model\Entity\Messagery newEntity($data = null, array $options = [])
 * @method \App\Model\Entity\Messagery[] newEntities(array $data, array $options = [])
 * @method \App\Model\Entity\Messagery|false save(\Cake\Datasource\EntityInterface $entity, $options = [])
 * @method \App\Model\Entity\Messagery saveOrFail(\Cake\Datasource\EntityInterface $entity, $options = [])
 * @method \App\Model\Entity\Messagery patchEntity(\Cake\Datasource\EntityInterface $entity, array $data, array $options = [])
 * @method \App\Model\Entity\Messagery[] patchEntities($entities, array $data, array $options = [])
 * @method \App\Model\Entity\Messagery findOrCreate($search, callable $callback = null, $options = [])
 *
 * @mixin \Cake\ORM\Behavior\TimestampBehavior
 */
class MessageriesTable extends Table
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

        $this->setTable('messageries');
        $this->setDisplayField('id');
        $this->setPrimaryKey('id');

        $this->addBehavior('Timestamp');

        $this->belongsTo('ExcelImporteds', [
            'foreignKey' => 'excel_imported_id',
            'joinType' => 'LEFT',
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
            ->scalar('message')
            ->allowEmptyString('message');

        $validator
            ->scalar('destinataire')
            ->maxLength('destinataire', 20)
            ->requirePresence('destinataire', 'create')
            ->notEmptyString('destinataire');

        $validator
            ->scalar('status')
            ->notEmptyString('status');

        return $validator;
    }
    
    public function findComplet(Query $query, $options = []) 
    {
        $destinataire = ! empty($options['destinataire']) ? $options['destinataire'] : null;
        if ($destinataire) {
            $query->where(['Messageries.destinataire LIKE' => "%$destinataire%"]);
        }
        
        $excelImportedId = ! empty($options['excel_imported_id']) ? $options['excel_imported_id'] : null;
        if ($excelImportedId) {
            $query->where(['Messageries.excel_imported_id' => $excelImportedId]);
        }
        
        $userId = ! empty($options['user_id']) ? $options['user_id'] : null;
        if ($userId) {
            $query->where(['Messageries.user_id' => $userId]);
        }
        
        $status = ! empty($options['status']) ? $options['status'] : null;
        if ($status) {
            $query->where(['Messageries.status' => $status]);
        }
        
        $type = ! empty($options['type']) ? $options['type'] : null;
        if ($type) {
            $query->where(['Messageries.type' => $status]);
        }

        return $query;
    }

    /**
     * Returns a rules checker object that will be used for validating
     * application integrity.
     *
     * @param \Cake\ORM\RulesChecker $rules The rules object to be modified.
     * @return \Cake\ORM\RulesChecker
     */
    public function buildRules(RulesChecker $rules)
    {
        $rules->add($rules->existsIn(['excel_imported_id'], 'ExcelImporteds'));

        return $rules;
    }
    
    
    /**
     * beforeSave callback
     *
     * @param $options array
     * @return boolean
     */
    public function beforeSave($event, $entity, $options) {
        
        if ($entity->isNew()) {
            $entity->user_id = (new Session)->read('Auth.User.id') ? : 0;
        }
    }
}
