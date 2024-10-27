<?php
$titrePage = "Utilisateur";
$this->start('breadcumb');
$this->Breadcrumbs->add(
        'Tableau de bord', ['controller' => 'Dashboards', 'action' => 'index']
);

$this->Breadcrumbs->add($titrePage);

echo $this->element('breadcrumb', ['titrePage' => $titrePage]);
$this->end();

$this->start('actionTitle');
if ($isAdmin) {
    echo $this->Html->link('<i class="mdi mdi-login"></i> Se connecter', ['action' => 'login', $user->id], ['escape' => false, "class" => "btn pull-right hidden-sm-down btn-success"]);
}
echo $this->Html->link('<i class="mdi mdi-pencil-circle"></i> Changer le mot de passe', ['action' => 'editPassword', $user->id, $user->group_user], ['escape' => false, "class" => "btn pull-right hidden-sm-down btn-success", "style" => "margin-right:5px;"]);
echo $this->Html->link('<i class="mdi mdi-pencil-circle"></i> Edit', ['action' => 'edit', $user->id, $user->group_user], ['escape' => false, "class" => "btn pull-right hidden-sm-down btn-success", "style" => "margin-right:5px;"]);

$this->end();
?>

<div class="col-12">
    <div class="page-header align-items-start min-vh-50 pt-5 pb-11 m-3 border-radius-lg" style="background-image: url('../assets/img/curved-images/curved14.jpg');">
        <span class="mask bg-gradient-dark opacity-6"></span>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-5 text-center mx-auto">
                    <h1 class="text-white mb-2 mt-5">Utilisateur</h1>
                    <p class="text-lead text-white">Modification de l'utilisateur et du paramettre modem.</p>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row mt-lg-n10 mt-md-n11 mt-n10">
            <div class="col-xl-4 col-lg-5 col-md-7 mx-auto">
                <div class="card z-index-0">
                    <div class="card-body">
                        <?= $this->Form->create($user, ['type' => 'file', 'role' => 'form']); ?>
                            <div class="mb-3">
                                <input type="email" class="form-control" placeholder="Email" aria-label="Email" aria-describedby="email-addon" value='<?= $user->email ?>'>
                            </div>
                            <div class="mb-3">
                                <input type="text" class="form-control" placeholder="Nom" aria-label="nom" name="nom" aria-describedby="text-addon"  value='<?= $user->nom ?>'> 
                            </div>
                            <div class="mb-3">
                                <input type="text" class="form-control" placeholder="Prénom" aria-label="prénom" name="prenom" aria-describedby="text-addon" value='<?= $user->prenom ?>'> 
                            </div>
                            <div class="mb-3">
                                <input type="password" class="form-control" placeholder="Mot de passe" aria-label="Password" aria-describedby="password-addon">
                            </div>
                            <div class="mb-3">
                                <input type="password" class="form-control" placeholder="Confirmer mot de passe" aria-label="Password" aria-describedby="password-addon">
                            </div>
                        
                            <div class="mb-3">
                                <input type="text" class="form-control" placeholder="Mot de passe du modem" aria-label="Password" aria-describedby="password-addon" value='<?= $user->mdp_modem ?>'>
                            </div>
                        
                            <div class="mb-3">
                                <input class="form-control form-control-sm" name="photo" id="formFileSm" type="file" placeholder="Photo de profil" aria-label="Aucun fichier" />
                            </div>
                        
                            <div class="text-center">
                                <button type="button" class="btn bg-gradient-dark w-100 my-4 mb-2">Enregistrer</button>
                            </div>
                        <?= $this->Form->end(); ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>