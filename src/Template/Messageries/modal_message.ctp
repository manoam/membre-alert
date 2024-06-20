<div class="modal fade" id="modalMessage" tabindex="-1" role="dialog" aria-labelledby="exampleModalMessageTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <?= $this->Form->create(null, ['url' => ['action' => 'sendMessage'], 'id' => 'form-send-message']); ?>
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modal-label">Message de 034 52 522 08</h5>
                    <button type="button" class="btn-close text-dark" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="modal-message" style="max-height: 550px;overflow: auto;"></div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Message:</label>
                        <textarea class="form-control" id="message-text" name="message"></textarea>
                    </div>
                    <input type="hidden" name="destinataire" id="modal-destinataire">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn bg-gradient-secondary" data-bs-dismiss="modal">Fermer</button>
                    <button type="submit" class="btn bg-gradient-primary">Envoyer</button>
                </div>
            </div>
        <?= $this->Form->end(); ?>
    </div>
</div>