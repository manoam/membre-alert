<?php
namespace App\Test\TestCase\Model\Table;

use App\Model\Table\ExcelImportedsTable;
use Cake\ORM\TableRegistry;
use Cake\TestSuite\TestCase;

/**
 * App\Model\Table\ExcelImportedsTable Test Case
 */
class ExcelImportedsTableTest extends TestCase
{
    /**
     * Test subject
     *
     * @var \App\Model\Table\ExcelImportedsTable
     */
    public $ExcelImporteds;

    /**
     * Fixtures
     *
     * @var array
     */
    public $fixtures = [
        'app.ExcelImporteds',
        'app.Messageries',
    ];

    /**
     * setUp method
     *
     * @return void
     */
    public function setUp()
    {
        parent::setUp();
        $config = TableRegistry::getTableLocator()->exists('ExcelImporteds') ? [] : ['className' => ExcelImportedsTable::class];
        $this->ExcelImporteds = TableRegistry::getTableLocator()->get('ExcelImporteds', $config);
    }

    /**
     * tearDown method
     *
     * @return void
     */
    public function tearDown()
    {
        unset($this->ExcelImporteds);

        parent::tearDown();
    }

    /**
     * Test initialize method
     *
     * @return void
     */
    public function testInitialize()
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test validationDefault method
     *
     * @return void
     */
    public function testValidationDefault()
    {
        $this->markTestIncomplete('Not implemented yet.');
    }
}
