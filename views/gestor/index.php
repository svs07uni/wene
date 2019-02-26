<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $searchModel app\models\UsuariosSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Gestores';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="usuario-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php Pjax::begin(); ?>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
<!--
    <p>
        <?= Html::a('Crear Gestor', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
-->
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [            
            'id_registro',
            'dni',
            'nombre',
            'apellido',
            ['label'=>'Gestiona',
            'value' => function ($data) 
            {
                 $abarca = "";
                 foreach ($data->abarcas as $unaDependencia) {
                     $abarca .= ' - '.($unaDependencia->dependencia->nombre);
                 }
                 return $abarca;
            },],
            //'activo:boolean',
            //'nacionalidad',
            //'direccion',
            //'id_localidad',
            //'fecha_nac',
            //'foto',
            //'nombre_foto',
            //'id_rol',

            [
                'class' => 'yii\grid\ActionColumn',
                'template' => ' {update}',
                'header' => 'Editar',
                'buttons' => [
                            'updateDep' => function ($url, $model) {
                                return Html::a('<span class="fa fa-address-card"></span>', $url, [
                                            'title' => Yii::t('app', 'lead-delete'),
                                ]);
                            }
                        ],
                'urlCreator' => function ($action, $model, $key, $index) {
                                        if ($action === 'updateDep') {
                                            $url ='actualizarusr?id='.$model->id_registro;
                                            return $url;
                                        }else{
                                            if ($action === 'update') {
                                                $url =Url::to(['gestor/update/'.$model->id_registro]);
                                                return $url;
                                            }
                                        }
                                 }                
            ],
        ],
    ]); ?>
    <?php Pjax::end(); ?>
</div>
