<?= $this->Html->script('messageries/index.js?' . time(), ['block' => 'script']) ?>

<?php
$titrePage = 'Message reçu';

$this->start('breadcumb');
$this->Breadcrumbs->add(
    'Tableau de bord',
    ['controller' => 'ExcelImported', 'action' => 'index']
);

$this->Breadcrumbs->add($titrePage);

echo $this->element('breadcrumb',['titrePage' => $titrePage]);
$this->end();
?>

<div class="row my-4">
    <div class="col-lg-12 col-md-12 mb-md-0 mb-4">
        <div class="card">
            <div class="card-header pb-0">
                <div class="row">
                    <div class="col-lg-6 col-7">
                        <h6>Message reçu</h6>
                    </div>
                </div>
            </div>
            <div class="card-body px-0 pb-2">
                
                
                <div class="d-block">
                    <?= $this->Form->create(false, ['type' => 'GET', 'class' => 'form-filtre mt-4']); ?>
                        <input type="hidden" id="id_baseUrl" value="<?= $this->Url->build('/', true) ?>"/>

                        <?php $periode = $options['periode'] ?? ''; ?>

                        <div class="filter-list-wrapper devis-filter-wrapper <?= $periode == 'custom_threshold' ? 'custom-col-width-small' : '' ?>">
                            <div class="filter-block">
                                <?= $this->Form->control('destinataire', ['label' => false, 'default' => $options['destinataire'] ?? '', 'placeholder' => 'Rechercher par expediteur']); ?>
                            </div>

                            <div class="filter-block container_date_threshold">
                                <?= $this->Form->control('date_threshold', ['type' => 'text', 'label' => false, 'value' => @$options['date_threshold'], 'class' => 'form-control date_threshold', 'id' => 'id_date_threshold']); ?>
                            </div>
                            
                            <div class="filter-block col-filter">
                                <?= $this->Form->button('<i class="fa fa-search"></i> Filtrer', ['label' => false, 'class' => 'btn btn-outline-primary'] );?>
                                <?= $this->Html->link('<i class="fa fa-refresh"></i>', ['?' => false], ["data-toggle" => "tooltip", "title" => "Réinitialiser", "class" => "btn btn-outline-dark", "escape" => false]);?>
                            </div>
                        </div>
                    <?= $this->Form->end(); ?>
                </div>
                
                <div class="table-responsive">
                    <table class="table align-items-center mb-0">
                        <thead>
                            <tr>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Expediteur</th>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Message</th>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Date</th>
                            </tr>
                        </thead>

                        <tbody>

                            <?php foreach ($messageries as $messagery) : ?>

                                <tr>
                                    <td>
                                        <div class="d-flex px-2 py-1">
                                            <div>
                                                <?= $this->Html->image('small-logos/icons-messages.svg', ['alt' => 'xd', "class" => "avatar avatar-sm me-3"]); ?>
                                            </div>
                                            <div class="d-flex flex-column justify-content-center send-message cursor-pointer" data-bs-titre="Message de <?= $messagery->destinataire ?>" data-bs-dest="<?= $messagery->destinataire ?>">
                                                <h6 class="mb-0 text-sm"><?= $messagery->destinataire ?></h6>
                                            </div>
                                        </div>
                                    </td>

                                    <td class="align-middle">
                                        <span class="text-xs font-weight-bold"> <?= $messagery->message ?> </span>
                                    </td>
                                    <td class="align-middle text-center text-sm text-nowrap">
                                        <?= $messagery->created->format('d/m/Y à H:i') ?>
                                    </td>
                                </tr>

                            <?php endforeach; ?>

                        </tbody>
                    </table>
                    <?= $this->element('tfoot_pagination') ?>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
var csrfToken = <?= json_encode($this->request->getParam('_csrfToken')) ?>;
</script>

<?= $this->element('../Messageries/modal_message') ?>