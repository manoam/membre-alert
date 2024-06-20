<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Messagery $messagery
 */
?>
<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('Edit Messagery'), ['action' => 'edit', $messagery->id]) ?> </li>
        <li><?= $this->Form->postLink(__('Delete Messagery'), ['action' => 'delete', $messagery->id], ['confirm' => __('Are you sure you want to delete # {0}?', $messagery->id)]) ?> </li>
        <li><?= $this->Html->link(__('List Messageries'), ['action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Messagery'), ['action' => 'add']) ?> </li>
        <li><?= $this->Html->link(__('List Excel Importeds'), ['controller' => 'ExcelImporteds', 'action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Excel Imported'), ['controller' => 'ExcelImporteds', 'action' => 'add']) ?> </li>
    </ul>
</nav>
<div class="messageries view large-9 medium-8 columns content">
    <h3><?= h($messagery->id) ?></h3>
    <table class="vertical-table">
        <tr>
            <th scope="row"><?= __('Excel Imported') ?></th>
            <td><?= $messagery->has('excel_imported') ? $this->Html->link($messagery->excel_imported->id, ['controller' => 'ExcelImporteds', 'action' => 'view', $messagery->excel_imported->id]) : '' ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Destinataire') ?></th>
            <td><?= h($messagery->destinataire) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Status') ?></th>
            <td><?= h($messagery->status) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Id') ?></th>
            <td><?= $this->Number->format($messagery->id) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Created') ?></th>
            <td><?= h($messagery->created) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Modified') ?></th>
            <td><?= h($messagery->modified) ?></td>
        </tr>
    </table>
    <div class="row">
        <h4><?= __('Message') ?></h4>
        <?= $this->Text->autoParagraph(h($messagery->message)); ?>
    </div>
</div>
