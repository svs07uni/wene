<?php
use app\models\User;
use yii\helpers\Url;
$nombre = Yii::$app->user->getNombre();
$apellido = Yii::$app->user->getApellido();
$usuario = Yii::$app->user->identity;

?>
<aside class="main-sidebar">

    <section class="sidebar">

        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
            <?php 
                if (is_null($usuario) || !isset($usuario->nombre_foto)){
                   echo("<img src='".Url::to(['uploads/default.png'])."' class='user-image' />");
                }
                else{
                    echo("<img src='".Url::to(['uploads/'.$usuario->id_registro.".".$usuario->nombre_foto])."' style='border-radius:50%;' />");
                }
            ?>
            </div>
            <div class="pull-left info">
                <p class="text-capitalize"><?php echo $nombre,' ',$apellido?></p>

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
        <!-- /.search form  agregar en gestor añadir convocatoria convocatoria/index-->

        <?= dmstr\widgets\Menu::widget(
            [
                'options' => ['class' => 'sidebar-menu tree', 'data-widget'=> 'tree'],
                'items' => [
                    ['label' => 'Menu', 'options' => ['class' => 'header']],
                    ['label' => 'Mis Postulaciones', 
                     'icon' => 'list', 
                     'url' => ['convocatoriausuario/misconvocatorias'], 
                     'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->id_rol == User::ROLE_POSTULANTE
                    ],
                    ['label' => 'Convocatorias',
                        'icon'=>'fas fa-edit',
                        'url' => ['/convocatoria/index'],
                        'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->id_rol == User::ROLE_GESTOR
                    ],
                    ['label' => 'Instituciones',
                        'icon'=>'fas fa-edit',
                        'url' => ['/institucion/index'],
                        'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->id_rol == User::ROLE_GESTOR
                    ],
                    ['label' => 'Mi CV', 
                     'icon' => 'fa fa-id-card-o', 
                     'url' => ['usuario/miperfil'], 
                        'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->id_rol == User::ROLE_POSTULANTE
                    ],
                    
                    ['label' => 'Iniciar sesión', 'icon'=>'fa fa-user-circle','url' => ['site/login'], 'visible' => Yii::$app->user->isGuest],
                    ['label' => 'Acerca de', 'icon'=>'fas fa-info-circle', 'url' => ['site/about']],
                    ['label' => 'Contactos', 'icon'=>'far fa-comments', 'url' => ['site/contact']]
                    
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
