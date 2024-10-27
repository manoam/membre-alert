<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Nepcha Analytics (nepcha.com) -->
        <?= $this->Html->charset() ?>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="apple-touch-icon" sizes="76x76" href="<?= $this->Url->build('/img/logo-cecam.png') ?>">
        <link rel="icon" type="image/png" href="<?= $this->Url->build('/img/logo-cecam.png') ?>">
        <title>
            MemberAlert | Système de messagerie automatisée
        </title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <?= $this->fetch('meta') ?>
        <?= $this->fetch('css') ?>
        <!--     Fonts and icons     -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
        <!-- Nucleo Icons -->
        <?= $this->Html->css('nucleo-icons.css') ?>
        <?= $this->Html->css('nucleo-svg.css') ?>
        <?= $this->Html->css('libs/bootstrap-select/bootstrap-select.min') ?>
        <?= $this->Html->css('libs/select2/select2.min.css') ?>
        <?= $this->Html->css('custom.css') ?>
        <!-- CSS Files -->
        <?= $this->Html->css('soft-ui-dashboard.css?v=1.0.7') ?>

    </head>

    <body class="g-sidenav-show bg-gray-100">
        <input type="hidden" id="id_baseUrl" value="<?= $this->Url->build('/', true) ; ?>"/>
        <!--Menu-->
        <?= $this->element('menu') ?>
        <!--Fin Menu-->
        <div class="main-content position-relative bg-gray-100 max-height-vh-100 h-100">
            <!-- End Navbar -->
            <!-- End Barre de Menu de messages -->
            <div class="container-fluid py-4">

                <?= $this->Flash->render() ?>
                <?= $this->fetch('content') ?>

                <footer class="footer pt-3  ">
                    <div class="container-fluid">
                        <div class="row align-items-center justify-content-lg-between">
                            <div class="col-lg-6 mb-lg-0 mb-4">
                                <div class="copyright text-center text-sm text-muted text-lg-start">
                                    © <script>
                                        document.write(new Date().getFullYear())
                                    </script>, made with <i class="fa fa-heart"></i> by
                                    <a href="https://www.creative-tim.com" class="font-weight-bold" target="_blank">Nero</a> pour une meilleure expérience
                                </div>
                            </div>
                        </div>
                    </div>
                </footer>
                
            </div>
        </div>
        
        <!--   Core JS Files   -->
        <?= $this->Html->script('libs/jquery/jquery.min.js') ?>
        <?= $this->Html->script('core/popper.min.js') ?>
        <?= $this->Html->script('core/bootstrap.min.js') ?>
        <?= $this->Html->script('plugins/perfect-scrollbar.min.js') ?>
        <?= $this->Html->script('plugins/smooth-scrollbar.min.js') ?>
        <!-- Font Awesome Icons -->
        <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
        <!-- Nepcha is a easy-to-use web analytics. No cookies and fully compliant with GDPR, CCPA and PECR. -->
        <script defer data-site="YOUR_DOMAIN_HERE" src="https://api.nepcha.com/js/nepcha-analytics.js"></script>
        <script>
            var win = navigator.platform.indexOf('Win') > -1;
            if (win && document.querySelector('#sidenav-scrollbar')) {
                var options = {
                    damping: '0.5'
                };
                Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
            }
        </script>
        <!-- Github buttons -->
        <script async defer src="https://buttons.github.io/buttons.js"></script>
        <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
        <?= $this->Html->script('soft-ui-dashboard.min.js?v=1.0.7') ?>
        <?= $this->Html->script('libs/select2/select2.full.min.js'); ?>

        <?= $this->fetch('script') ?>
        <?= $this->Html->script('custom.js?' . time()) ?>
        <?= $this->Html->script('general.js?' . time()) ?>
    </body>

</html>
