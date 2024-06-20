<?php
namespace App\Controller\Component;

use Cake\Controller\Component;
use PhpOffice\PhpSpreadsheet\IOFactory;

class SpreadSheetComponent extends Component
{
    protected $_defaultConfig = [];

    public function initialize(array $config = []) : void
    {
        ini_set('memory_limit', '16G');
    	parent::initialize($config);
    }

    
    function read($fullPath, $ligne = null)
    {
    	$fileType   = IOFactory::identify($fullPath);
    	$objReader  = IOFactory::createReader($fileType);
    	$objReader->setReadDataOnly(true);
    	$spreadsheet = $objReader->load($fullPath);

    	$results = $spreadsheet->getActiveSheet()->toArray(null, true, true, true);
                
        if ($ligne !== null) {
            return ! empty($results[$ligne]) ? $results[$ligne] : null;
        }
        
    	return $results;
    }
    
    function countLigne($fullPath) 
    {
        return count($this->read($fullPath)) > 1 ? count($this->read($fullPath)) -1 : 0;
    }
}