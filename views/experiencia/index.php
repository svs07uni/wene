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
<h1 align="center"> Cargar Experiencias</h1>
<br>
<br>    
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
    <h3 align="center" > Experiencia Laboral</h3>
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

    <h3 align="center" > Aptitudes </h3>
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
            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{delete} {update} {view}',
                'header' => '',
                /*'urlCreator' => function ($action, $model, $key, $index) {
                                        if ($action === 'delete') {
                                            $url ='?d='.$model->id_aptitud;
                                            print_r($url);
                                            
                                            return $url;
                                        }
                                 }*/
                'buttons'=> [
                    'view' => function ($action, $model, $key) {
                        $url = 'aptitud/'. $model->id_aptitud;
                        return Html::a('Action', $url);                        
                    }

                ]               
            ],
        ],
    ]); ?>
    <br>
    <br>
    
    <h3 align="center" > Estudios Realizados</h3>
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
            'titulo',
            'institucion',
        		
        	['attribute'=>'fecha_egreso',
        			'format'=>['DateTime','php:d-m-Y']
        		],
            //'id_usuario',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

<br>
<br>
<h3 align="center" > Publicaciones Realizados</h3>
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
            ['attribute'=>'fecha',
        			'format'=>['DateTime','php:d-m-Y']
        		],
            //'id_usuario',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
