<?= $this->Html->script('send-sms/import_and_send_sms.js?' . time(), ['block' => 'script']) ?>

<input type="hidden" value="<?= $excelImportedId ?>" id="excel_imported_id">
<input type="hidden" value="<?= $excelImported->nombre_ligne ?>" id="nombre_ligne">
<input type="hidden" value="<?= $excelImported->num_ligne_imported ?>" id="num_ligne_imported">
<input type="hidden" value="<?= $this->Url->build(['action' => 'index']) ?>" id="redirectUrl">

<div class="row my-4">
    <div class="col-lg-12 col-md-12 mb-md-0 mb-4">
        <div class="card">
            <div class="card-header pb-0">
                <div class="row">
                    <div class="col-lg-6 col-7">
                        <h6>Envoi des messages</h6>
                    </div>
                </div>
            </div>
            <div class="card-body px-0 pb-2">

                <div class="progress-wrapper w-75 mx-auto">
                    <div class="progress-info">
                        <div class="progress-percentage">
                            <span class="text-xs font-weight-bold progress-percentage-span">0%</span>
                        </div>
                    </div>
                    <div class="progress">
                        <div class="progress-bar bg-gradient-success w-0" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <div class="message mt-2">Initialisé</div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
var csrfToken = <?= json_encode($this->request->getParam('_csrfToken')) ?>;
</script>
