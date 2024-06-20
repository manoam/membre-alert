<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
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
        <!-- CSS Files -->
        <?= $this->Html->css('soft-ui-dashboard.css?v=1.0.7') ?>
        <!-- Font Awesome Icons -->
        <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
        <script defer data-site="YOUR_DOMAIN_HERE" src="https://api.nepcha.com/js/nepcha-analytics.js"></script>
    </head>

    <body class="">
        <div class="container position-sticky z-index-sticky top-0">
            <div class="row">
                <div class="col-12">
                    <!-- Navbar -->
                    <nav class="navbar navbar-expand-lg blur blur-rounded top-0 z-index-3 shadow position-absolute my-3 py-2 start-0 end-0 mx-4">
                        <div class="container-fluid pe-0">
                            <a class="navbar-brand font-weight-bolder ms-lg-0 ms-3 " href="../pages/dashboard.html">
                                MemberAlert | Système de messagerie automatisée
                            </a>
                        </div>
                    </nav>
                    <!-- End Navbar -->
                </div>
            </div>
        </div>
        <main class="main-content  mt-0">
            <section>
                <div class="page-header min-vh-75">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-4 col-lg-5 col-md-6 d-flex flex-column mx-auto">
                                <div class="card card-plain mt-8">
                                    <div class="card-header pb-0 text-left bg-transparent">
                                        <h3 class="font-weight-bolder text-info text-gradient">Tongasoa, Bienvenu, Welcome</h3>
                                        <p class="mb-0">Entrez votre email et votre mot de passe pour vous connecter</p>
                                    </div>
                                    <div class="card-body">
                                        <?= $this->fetch('content') ?>
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="oblique position-absolute top-0 h-100 d-md-block d-none me-n8">
                                    <div class="oblique-image bg-cover position-absolute fixed-top ms-auto h-100 z-index-0 ms-n6" style="background-image:url(<?= $this->Url->build('/img/sign-in.jpg') ?>)"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <!-- -------- START FOOTER 3 w/ COMPANY DESCRIPTION WITH LINKS & SOCIAL ICONS & COPYRIGHT ------- -->
        <footer class="footer py-5">
            <div class="container">
                <div class="row">
                    <div class="col-8 mx-auto text-center mt-1">
                        <p class="mb-0 text-secondary">
                            Copyright © <script>
                                document.write(new Date().getFullYear())
                            </script> Nero SARL
                        </p>
                    </div>
                </div>
            </div>
        </footer>
        <!-- -------- END FOOTER 3 w/ COMPANY DESCRIPTION WITH LINKS & SOCIAL ICONS & COPYRIGHT ------- -->
        <!--   Core JS Files   -->  
        <?= $this->Html->script('libs/jquery/jquery.min.js') ?>
        <?= $this->Html->script('core/popper.min.js') ?>
        <?= $this->Html->script('core/bootstrap.min.js') ?>
        <?= $this->Html->script('plugins/perfect-scrollbar.min.js') ?>
        <?= $this->Html->script('plugins/smooth-scrollbar.min.js') ?>
        <script>
            var win = navigator.platform.indexOf('Win') > -1;
            if (win && document.querySelector('#sidenav-scrollbar')) {
                var options = {
                    damping: '0.5'
                }
                Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
            }
        </script>
        <!-- Github buttons -->
        <script async defer src="https://buttons.github.io/buttons.js"></script>
        <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
        <script src="../assets/js/soft-ui-dashboard.min.js?v=1.0.7"></script>
    </body>

</html>