<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\ExcelImported $excelImported
 */
?>
<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Form->postLink(
                __('Delete'),
                ['action' => 'delete', $excelImported->id],
                ['confirm' => __('Are you sure you want to delete # {0}?', $excelImported->id)]
            )
        ?></li>
        <li><?= $this->Html->link(__('List Excel Importeds'), ['action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('List Messageries'), ['controller' => 'Messageries', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Messagery'), ['controller' => 'Messageries', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="excelImporteds form large-9 medium-8 columns content">
    <?= $this->Form->create($excelImported) ?>
    <fieldset>
        <legend><?= __('Edit Excel Imported') ?></legend>
        <?php
            echo $this->Form->control('nom');
            echo $this->Form->control('nom_excel');
            echo $this->Form->control('message');
            echo $this->Form->control('nombre_ligne');
            echo $this->Form->control('num_ligne_imported');
            echo $this->Form->control('status');
        ?>
    </fieldset>
    <?= $this->Form->button(__('Submit')) ?>
    <?= $this->Form->end() ?>
</div>
