<?= $this->Flash->render() ?>
<?= $this->Form->create(null, ["class"=>"inner-login-wrapper", "id"=>"loginform"]) ?>
    <label>Email</label>
    <div class="mb-3">
        <input type="email" name="email" class="form-control" placeholder="Email" aria-label="Email" aria-describedby="email-addon">
    </div>
    <label>Mot de passe</label>
    <div class="mb-3">
        <input type="password" name="password" class="form-control" placeholder="Password" aria-label="Password" aria-describedby="password-addon">
    </div>
    <div class="form-check form-switch">
        <input class="form-check-input" type="checkbox" id="rememberMe" checked="">
        <label class="form-check-label" for="rememberMe">Souviens-toi de moi</label>
    </div>
    <div class="text-center">
        <button type="submit" class="btn bg-gradient-info w-100 mt-4 mb-0">Se connecter</button>
    </div>
              
<?= $this->Form->end() ?>
