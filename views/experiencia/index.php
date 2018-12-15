<?php

use yii\helpers\Html;
use yii\grid\GridView;
//para el date picker
use dosamigos\datepicker\DatePicker;
use dosamigos\datepicker\DateRangePicker;
/* @var $this yii\web\View */
/* @var $searchModel app\models\ExperienciaSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Experiencia Laboral';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="experiencia-index">

    
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
    <br>
    <p>
        <?= Html::a('Agregar Experiencia Laboral', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            //'id_experiencia',
            //'id_usuario',
            'titulo',
            'descripcion',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
    <br>
    <br>

    <h3> Aptitudes </h3>
    <br>
    <p>
        <?= Html::a('Agregar Aptitudes', ['createaptitud'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProviderAptitud,
        'filterModel' => $searchModelAptitud,

        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            //'id_aptitud',
            'tipo',
            'nivel',
            //'id_usuario',
/*
            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{delete}',
                'header' => 'Quitar',
                'urlCreator' => function ($action, $model, $key, $index) {
                                        if ($action === 'delete') {
                                            $url ='?d='.$model->id_dependencia;
                                            return $url;
                                        }
                                 }
            ],*/
        ],
    ]); ?>
    <br>
    <br>
    
    <h3> Estudios Realizados</h3>
    <br>
    <p>
        <?= Html::a('Agregar Estudios', ['createestudio'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProviderEstudio,
        'filterModel' => $searchModelEstudio,

        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            //'id_aptitud',
            'institucion',
            'fecha_egreso',
            //'id_usuario',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>


<h3> Publicaciones Realizados</h3>
    <br>
    <p>
        <?= Html::a('Agregar Publicaciones', ['createpublicacion'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProviderPublicacion,
        'filterModel' => $searchModelPublicacion,

        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            //'id_aptitud',
            'titulo',
            'fecha',
            //'id_usuario',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
