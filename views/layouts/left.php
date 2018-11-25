<?php
use app\models\User;
$nombre = Yii::$app->user->getNombre();
$apellido = Yii::$app->user->getApellido();
?>
<aside class="main-sidebar">

    <section class="sidebar">

        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="<?= $directoryAsset ?>/img/user2-160x160.jpg" class="img-circle" alt="User Image"/>
            </div>
            <div class="pull-left info">
                <p><?php echo $nombre,' ',$apellido?></p>

            </div>
        </div>

        <!-- search form -->
        <!--<form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="Search..."/>
              <span class="input-group-btn">
                <button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
            </div>
        </form>
        <!-- /.search form -->

        <?= dmstr\widgets\Menu::widget(
            [
                'options' => ['class' => 'sidebar-menu tree', 'data-widget'=> 'tree'],
                'items' => [
                    ['label' => 'Menu', 'options' => ['class' => 'header']],
                    ['label' => 'Mis Postulaciones', 
                     'icon' => 'list', 
                     'url' => [''], 
                     'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->id_rol == User::ROLE_POSTULANTE
                    ],
                    ['label' => 'Mi CV', 
                     'icon' => 'fa fa-address-book', 
                     'url' => [''], 
                     'visible' => !Yii::$app->user->isGuest
                    ],
                    ['label' => 'Rendimiento ', 
                     'icon' => 'pencil', 
                     'url' => [''], 
                        'visible' => !Yii::$app->user->isGuest,
                            'items'=>[
                                ['label'=>'Academico',
                                    'icon'=>'',
                                    'url'=>[''],
                                 ],   
                                ['label'=>'No Academico',
                                         'icon'=>'',
                                         'url'=>[''],
                                        ],
                                      ],
                    ],
                    ['label' => 'Login', 'icon'=>'','url' => ['site/login'], 'visible' => Yii::$app->user->isGuest],
                    ['label' => 'Acerca de', 'icon'=>'', 'url' => ['site/about'], 'visible' => Yii::$app->user->isGuest],
                    ['label' => 'Contactos', 'url' => ['site/contact'], 'visible' => Yii::$app->user->isGuest],
                    
                    /*[
                        'label' => 'Some tools',
                        'icon' => 'share',
                        'url' => '#',
                        'items' => [
                            ['label' => 'Gii', 'icon' => 'file-code-o', 'url' => ['/gii'],],
                            ['label' => 'Debug', 'icon' => 'dashboard', 'url' => ['/debug'],],
                            [
                                'label' => 'Level One',
                                'icon' => 'circle-o',
                                'url' => '#',
                                'items' => [
                                    ['label' => 'Level Two', 'icon' => 'circle-o', 'url' => '#',],
                                    [
                                        'label' => 'Level Two',
                                        'icon' => 'circle-o',
                                        'url' => '#',
                                        'items' => [
                                            ['label' => 'Level Three', 'icon' => 'circle-o', 'url' => '#',],
                                            ['label' => 'Level Three', 'icon' => 'circle-o', 'url' => '#',],
                                        ],
                                    ],
                                ],
                            ],
                        ],
                    ],*/
                ],
            ]
        ) ?>

    </section>

</aside>
