<?php foreach ($messages as $message) : ?> 
<div class="mb-4">
    <h6 class="user">
        <?= $message->created->format('d/m/Y à h:i') ?> 
        <?php if ($message->status === 'envoye') : ?>
            <i class="fa fa-check-circle" style="font-size:15px;color:green"></i>
        <?php else : ?>
            <i class="fa fa-warning" style="font-size:15px;color:red"></i>
        <?php endif; ?>
    </h6>
    <div class="card card-frame">
        <div class="card-body <?= $message->type ?>">
            <?= $message->message ?>
        </div>
    </div>
</div>
<?php endforeach; ?>