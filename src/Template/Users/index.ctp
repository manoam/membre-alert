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
<div class="container-fluid py-4">
    <div class="row">
        <div class="col-12">
            <div class="card mb-4">
                <div class="card-header pb-0">
                    <h6>Utilisateurs</h6>
                </div>
                <div class="card-body px-0 pt-0 pb-2">
                    <div class="table-responsive p-0">
                        <table class="table align-items-center mb-0">
                            <thead>
                                <tr>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">User</th>
                                    <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Status</th>
                                    <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Dernière connexion</th>
                                    <th class="text-secondary opacity-7"></th>
                                </tr>
                            </thead>
                            <tbody>
                                
                                <?php foreach ($users as $user) : ?>
                                
                                    <tr>
                                        <td>
                                            <div class="d-flex px-2 py-1">
                                                <div>
                                                    <img src="<?= $user->url_photo ?>" class="avatar avatar-sm me-3" alt="user1">
                                                </div>
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="mb-0 text-sm"><?= $user->full_name ?></h6>
                                                    <p class="text-xs text-secondary mb-0"><?= $user->email ?></p>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="align-middle text-center text-sm">
                                            <span class="badge badge-sm bg-gradient-success">Online</span>
                                        </td>
                                        <td class="align-middle text-center">
                                            <span class="text-secondary text-xs font-weight-bold">23/02/24</span>
                                        </td>
                                        <td class="align-middle">
                                            <a href="javascript:;" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip" data-original-title="Edit user">
                                                Supprimer
                                            </a>
                                        </td>
                                    </tr>
                                    <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-12">
            <div class="page-header align-items-start min-vh-50 pt-5 pb-11 border-radius-lg" style="background-image: url('../img/curved-images/curved14.jpg');">
                <span class="mask bg-gradient-dark opacity-6"></span>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-5 text-center mx-auto">
                            <h1 class="text-white mb-2 mt-5">Utilisateur</h1>
                            <p class="text-lead text-white">Ajouter des utilisateurs à partir de cette interface.</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row mt-lg-n10 mt-md-n11 mt-n10">
                    <div class="col-xl-4 col-lg-5 col-md-7 mx-auto">
                        <div class="card z-index-0">
                            <div class="card-body">
                                <form role="form text-left">
                                    <div class="mb-3">
                                        <input type="text" class="form-control" placeholder="Nom" aria-label="Nom" name="nom" autocomplete="off"> 
                                    </div>
                                    <div class="mb-3">
                                        <input type="text" class="form-control" placeholder="Prenom" aria-label="Prenom" name="prenom" autocomplete="off"> 
                                    </div>
                                    <div class="mb-3">
                                        <input type="email" class="form-control" placeholder="Email" aria-label="Email" aria-describedby="email-addon">
                                    </div>
                                    <div class="mb-3">
                                        <input type="password" class="form-control" placeholder="Mot de passe" aria-label="Password" aria-describedby="password-addon">
                                    </div>
                                    <div class="mb-3">
                                        <input type="password" class="form-control" placeholder="Confirmer mot de passe" aria-label="Password" aria-describedby="password-addon">
                                    </div>
                                    <div class="mb-3">
                                        <input class="form-control form-control-sm" name="photo" id="formFileSm" type="file" placeholder="Photo de profil" aria-label="Aucun fichier" />
                                    </div>
                                    <div class="text-center">
                                        <button type="button" class="btn bg-gradient-dark w-100 my-4 mb-2">Créer un utilisateur</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>