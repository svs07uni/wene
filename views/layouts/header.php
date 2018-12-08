<?php
use yii\helpers\Html;
/* @var $this \yii\web\View */
/* @var $content string */
$nombre=Yii::$app->user->getNombre();
$apellido = Yii::$app->user->getApellido();
?>

<header class="main-header">

    <?= Html::a('<span class="logo-mini">W</span><span class="logo-lg">Wene</span>', Yii::$app->homeUrl, ['class' => 'logo']) ?>

    <nav class="navbar navbar-static-top" role="navigation">

        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>

        <div class="navbar-custom-menu">

            <ul class="nav navbar-nav">

                <?php if(!Yii::$app->user->isGuest){ ?>
                    <li class="dropdown notifications-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-bell-o"></i>
                            <span class="label label-warning">10</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header">Existen 10 convocatorias activas</li>
                            <li>
                                <!-- inner menu: contains the actual data -->
                                <ul class="menu">
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-users text-aqua"></i> 5 pasantías
                                        </a>
                                    </li>
                                    
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-users text-red"></i> 4 bolsa de trabajo
                                        </a>
                                    </li>

                                    <li>
                                        <a href="#">
                                            <i class="fa fa-users text-green"></i> 1 actividad de extensión
                                        </a>
                                    </li>
                                    
                                </ul>
                            </li>
                            <li class="footer"><a href="#">Ver todo</a></li>
                        </ul>
                    </li>
                <?php } ?>
                <!-- User Account: style can be found in dropdown.less -->

                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="<?= $directoryAsset ?>/img/user2-160x160.jpg" class="user-image" alt="User Image"/>
                        <span class="hidden-xs text-capitalize"><?php echo $nombre,' ',$apellido?></span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- User image -->
                        <li class="user-header">
                            <img src="<?= $directoryAsset ?>/img/user2-160x160.jpg" class="img-circle"
                                 alt="User Image"/>
                            <p class="text-capitalize">
                                <?php echo $nombre,' ',$apellido?> - Desarrollador Web 
                                <small>Egresado FAIF Nov. 2012</small>
                            </p>
                        </li>
                        <!-- Menu Body -->
                        <!--<li class="user-body">
                            <div class="col-xs-4 text-center">
                                <a href="#">Followers</a>
                            </div>
                            <div class="col-xs-4 text-center">
                                <a href="#">Sales</a>
                            </div>
                            <div class="col-xs-4 text-center">
                                <a href="#">Friends</a>
                            </div>
                        </li>
                        <!-- Menu Footer-->
                        <?php if(!Yii::$app->user->isGuest){ ?>
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="#" class="btn btn-default btn-flat">Perfil</a>
                                </div>
                                <div class="pull-right">
                                    <?= Html::a(
                                        'Salir',
                                        ['/site/logout'],
                                        ['data-method' => 'post', 'class' => 'btn btn-default btn-flat']
                                    ) ?>
                                </div>
                            </li>
                        <?php } ?>
                    </ul>
                </li>

                <!-- User Account: style can be found in dropdown.less -->
                <!--<li>
                    <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                </li>-->
            </ul>
        </div>
    </nav>
</header>
