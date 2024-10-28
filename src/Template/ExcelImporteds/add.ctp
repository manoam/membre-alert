<?php
$titrePage = 'Nouveau message de campagne';

$this->start('breadcumb');
$this->Breadcrumbs->add(
    'Tableau de bord',
    ['controller' => 'ExcelImported', 'action' => 'index']
);

$this->Breadcrumbs->add(
    'Excel importé',
    ['controller' => 'ExcelImported', 'action' => 'index']
);

$this->Breadcrumbs->add($titrePage);

echo $this->element('breadcrumb',['titrePage' => $titrePage]);
$this->end();
?>

<div class="row">
    <!-- Consigne -->
    <div class="col-12 col-xl-12">
        <div class="card h-100">
            <div class="card-header pb-0 p-3">
                <div class="row">
                    <div class="col-md-8 d-flex align-items-center">
                        <h6 class="mb-0">Consignes</h6>
                    </div>
                </div>
            </div>
            <div class="card-body p-3">
                <p class="text-sm">
                    Cette interface permet aux utilisateurs d'importer des listes de destinataires à partir de fichiers Excel tout en configurant les messages à envoyer. 
                    Vous pouvez personnaliser votre message.
                </p>
            </div>
        </div>
    </div>
    <!-- End consigne -->
    <!-- Champ de saisie -->
    <div class="col-12 mt-4">
        <div class="card mb-4">
            <?= $this->Form->create($excelImported, ['type' => 'file']) ?>
            <div class="card-header pb-0 p-3">
                <h6 class="mb-1">Nouveau message de campagne</h6>
                <p class="text-sm">Rédiger et personnaliser vos messages à envoyer</p>
            </div>
            <div class="card-body p-3">
                <div class="row">
                    <!-- Import contact -->
                    <div class="col-xl-12 col-md-12 mb-xl-0 mb-4">
                        <div class="card card-blog card-plain">

                            <div class="col-12 mb-4">
                                <h6 class="mb-0">Fichier excel</h6>
                                <input class="form-control form-control-sm" name="excel" id="formFileSm" type="file" placeholder="Aucun fichier" aria-label="Aucun fichier" />
                            </div>
                            <div class="position-relative mb-4">
                                <div class="form-floating">
                                    <input class="form-control" name="nom" id="formFileNom" type="text" placeholder="Objet du message" aria-label="Objet du message" />
                                    <label for="formFileNom">Objet du message</label>
                                </div>
                            </div>
                            <div class="position-relative">
                                <div class="form-floating">
                                    <textarea class="form-control" name="message" placeholder="Message (150 caractères max)" id="floatingTextarea"></textarea>
                                    <label for="floatingTextarea">Message (150 caractères max)</label>
                                </div>
                            </div>
                            <div class="card-body px-1 pb-0">

                                <div class="d-flex align-items-center justify-content-between">
                                    <button type="submit" class="btn btn-outline-primary btn-sm mb-0">Envoyer</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <?= $this->Form->end() ?>
        </div>
    </div>
    <!-- End Champ de saisie -->
</div>