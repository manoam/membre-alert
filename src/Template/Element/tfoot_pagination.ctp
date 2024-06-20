<?php $count = (int) @$this->Paginator->params()['count']; ?>

<div class="m-lg-4 clearfix">
    <div class="dt-pagination-wrapper">
        <div class="number-info-wrap">
            <?= $this->Paginator->counter('Affichage {{start}} à {{end}} sur {{count}} éléments');?>
        </div>
        <div class="page-number-list-wrap">
            <ul class="pagination">
                <?= $this->Paginator->first("") ?>
                <?= $this->Paginator->prev("") ?>
                <?= $this->Paginator->numbers() ?>
                <?= $this->Paginator->next('') ?>
                <?= $this->Paginator->last('') ?>
            </ul>
        </div>
    </div>
</div>