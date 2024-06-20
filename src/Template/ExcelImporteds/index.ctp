<?php
$titrePage = 'Excel importé';

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
                        <h6>Message de campagne</h6>
                    </div>
                </div>
            </div>
            <div class="card-body px-0 pb-2">
                <div class="table-responsive">
                    <table class="table align-items-center mb-0">
                        <thead>
                            <tr>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Nom du messages</th>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Date</th>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Expediteur</th>
                                <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Status</th>
                            </tr>
                        </thead>

                        <tbody>

                            <?php foreach ($excelImporteds as $excelImported) : ?>

                                <tr>
                                    <td>
                                        <div class="d-flex px-2 py-1">
                                            <div>
                                                <?= $this->Html->image('small-logos/icons-messages.svg', ['alt' => 'xd', "class" => "avatar avatar-sm me-3"]); ?>
                                            </div>
                                            <div class="d-flex flex-column justify-content-center">
                                                <h6 class="mb-0 text-sm"><?= $excelImported->nom ?></h6>
                                            </div>
                                        </div>
                                    </td>

                                    <td class="align-middle text-sm">
                                        <span class="text-xs font-weight-bold"> <?= $excelImported->created->format('d-m-Y à H:i') ?> </span>
                                    </td>
                                    <td class="align-middle">
                                        <div class="d-flex px-2 py-1">
                                          <div>
                                            <img src="<?= $this->Url->build('/img/team-4.jpg') ?>" class="avatar avatar-sm me-3" alt="user6">
                                          </div>
                                          <div class="d-flex flex-column justify-content-center">
                                            <h6 class="mb-0 text-sm"><?= $excelImported->user->full_name ?></h6>
                                            <p class="text-xs text-secondary mb-0"><?= $excelImported->user->email ?></p>
                                          </div>
                                        </div>
                                    </td>
                                    <td class="align-middle text-center text-sm">
                                        <span class="badge badge-sm badge-<?= $excelImported->status ?>"><?= @$status[$excelImported->status] ?></span>
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

