<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Messagery $messagery
 */
?>
<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('List Messageries'), ['action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('List Excel Importeds'), ['controller' => 'ExcelImporteds', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Excel Imported'), ['controller' => 'ExcelImporteds', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="messageries form large-9 medium-8 columns content">
    <?= $this->Form->create($messagery) ?>
    <fieldset>
        <legend><?= __('Add Messagery') ?></legend>
        <?php
            echo $this->Form->control('excel_imported_id', ['options' => $excelImporteds]);
            echo $this->Form->control('message');
            echo $this->Form->control('destinataire');
            echo $this->Form->control('status');
        ?>
    </fieldset>
    <?= $this->Form->button(__('Submit')) ?>
    <?= $this->Form->end() ?>
</div>
