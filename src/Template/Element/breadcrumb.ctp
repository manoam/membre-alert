<?php 
    $this->Breadcrumbs->setTemplates([
        'wrapper' => '<ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 ps-2 me-sm-6 me-5">{{content}}</ol>',
        'item' => '<li class="breadcrumb-item text-sm"><a href="{{url}}" class="text-white opacity-5">{{title}}</a></li>',
        'itemWithoutLink' => '<li class="breadcrumb-item text-white active" >{{title}}</li>',
        'separator' => null
    ]);

    echo $this->Breadcrumbs->render(
        ['class' => $class ?? 'breadcrumb']
    );

?>
<h6 class="text-white font-weight-bolder ms-2"><?= $titrePage ?></h6>
