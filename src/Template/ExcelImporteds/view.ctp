<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\ExcelImported $excelImported
 */
?>
<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('Edit Excel Imported'), ['action' => 'edit', $excelImported->id]) ?> </li>
        <li><?= $this->Form->postLink(__('Delete Excel Imported'), ['action' => 'delete', $excelImported->id], ['confirm' => __('Are you sure you want to delete # {0}?', $excelImported->id)]) ?> </li>
        <li><?= $this->Html->link(__('List Excel Importeds'), ['action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Excel Imported'), ['action' => 'add']) ?> </li>
        <li><?= $this->Html->link(__('List Messageries'), ['controller' => 'Messageries', 'action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Messagery'), ['controller' => 'Messageries', 'action' => 'add']) ?> </li>
    </ul>
</nav>
<div class="excelImporteds view large-9 medium-8 columns content">
    <h3><?= h($excelImported->id) ?></h3>
    <table class="vertical-table">
        <tr>
            <th scope="row"><?= __('Nom') ?></th>
            <td><?= h($excelImported->nom) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Nom Excel') ?></th>
            <td><?= h($excelImported->nom_excel) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Status') ?></th>
            <td><?= h($excelImported->status) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Id') ?></th>
            <td><?= $this->Number->format($excelImported->id) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Nombre Ligne') ?></th>
            <td><?= $this->Number->format($excelImported->nombre_ligne) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Num Ligne Imported') ?></th>
            <td><?= $this->Number->format($excelImported->num_ligne_imported) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Created') ?></th>
            <td><?= h($excelImported->created) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Modified') ?></th>
            <td><?= h($excelImported->modified) ?></td>
        </tr>
    </table>
    <div class="row">
        <h4><?= __('Message') ?></h4>
        <?= $this->Text->autoParagraph(h($excelImported->message)); ?>
    </div>
    <div class="related">
        <h4><?= __('Related Messageries') ?></h4>
        <?php if (!empty($excelImported->messageries)): ?>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <th scope="col"><?= __('Id') ?></th>
                <th scope="col"><?= __('Excel Imported Id') ?></th>
                <th scope="col"><?= __('Message') ?></th>
                <th scope="col"><?= __('Destinataire') ?></th>
                <th scope="col"><?= __('Status') ?></th>
                <th scope="col"><?= __('Created') ?></th>
                <th scope="col"><?= __('Modified') ?></th>
                <th scope="col" class="actions"><?= __('Actions') ?></th>
            </tr>
            <?php foreach ($excelImported->messageries as $messageries): ?>
            <tr>
                <td><?= h($messageries->id) ?></td>
                <td><?= h($messageries->excel_imported_id) ?></td>
                <td><?= h($messageries->message) ?></td>
                <td><?= h($messageries->destinataire) ?></td>
                <td><?= h($messageries->status) ?></td>
                <td><?= h($messageries->created) ?></td>
                <td><?= h($messageries->modified) ?></td>
                <td class="actions">
                    <?= $this->Html->link(__('View'), ['controller' => 'Messageries', 'action' => 'view', $messageries->id]) ?>
                    <?= $this->Html->link(__('Edit'), ['controller' => 'Messageries', 'action' => 'edit', $messageries->id]) ?>
                    <?= $this->Form->postLink(__('Delete'), ['controller' => 'Messageries', 'action' => 'delete', $messageries->id], ['confirm' => __('Are you sure you want to delete # {0}?', $messageries->id)]) ?>
                </td>
            </tr>
            <?php endforeach; ?>
        </table>
        <?php endif; ?>
    </div>
</div>
