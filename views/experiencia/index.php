<?php

use yii\helpers\Html;
use yii\grid\GridView;
//para el date picker
use dosamigos\datepicker\DatePicker;
use dosamigos\datepicker\DateRangePicker;
/* @var $this yii\web\View */
/* @var $searchModel app\models\ExperienciaSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
use yii\helpers\Url;
$this->title = 'Experiencia Laboral';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="experiencia-index">
<h1 align="center"> Adminitracion de Experiencias</h1>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
    <h3 align="center" > Experiencia Laboral</h3>
    <p>
        <?= Html::a('Agregar Experiencia Laboral', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
<div class="col-lg-11" style="position: relative;margin-left:45px; margin-right:15px; "> 
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            //'id_experiencia',
            //'id_usuario',
            'titulo',
            'descripcion',

            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{experienciaView}  ',
                'header' => '',
                'buttons'=> [
                    'experienciaView' => function ($url ,$modelExpericiencia) {
                        $url = Url::to(['view','id'=> $modelExpericiencia->id_experiencia]);
                        return Html::a('<span class="fa fa-pencil"></span>', $url,['title'=>'view']);                        
                    }
                ]               
            ],
        ],
    ]); ?>
</div>
<!--    APTITUDES   -->
    <h3 align="center" > Aptitudes </h3>
    <p>
        <?= Html::a('Agregar Aptitudes', ['createaptitud'], ['class' => 'btn btn-success']) ?>
    </p>
<div class="col-lg-11" style="position: relative;margin-left:45px; margin-right:15px; "> 
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
                'template' => '{aptitudUpdate} {aptitudView} {aptitudDelete} ',
                'header' => '',
                'buttons'=> [
                    'aptitudView' => function ($url ,$modelAptitud) {
                        $url = Url::to(['aptitudview','id'=> $modelAptitud->id_aptitud]);
                        return Html::a('<span class="fa fa-pencil"></span>', $url,['title'=>'view']);                        
                    }/*,
                    'aptitudUpdate' => function ($url ,$modelAptitud) {
                        $url = Url::to(['aptitudupdate','id'=> $modelAptitud->id_aptitud]);
                        return Html::a('<span class="fa fa-pencil"></span>', $url,['title'=>'view']);                        
                    },
                    'aptitudDelete' => function ($url ,$modelAptitud) {
                        $url = Url::to(['aptituddelete','id'=> $modelAptitud->id_aptitud]);
                        return Html::a('<span class="fa fa-trash-o"></span>', $url,['title'=>'view']);                        
                    }*/

                ]               
            ],
        ],
    ]); ?>
</div>

<!--    ESTUDIOS REALIZADOS   -->
    <h3 align="center" > Estudios Realizados</h3>
    <p>
        <?= Html::a('Agregar Estudios', ['createestudio'], ['class' => 'btn btn-success']) ?>
    </p>
<div class="col-lg-11" style="position: relative;margin-left:45px;margin-right:15px; "> 

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

            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{estudioUpdate} {estudioView} {estudioDelete} ',
                'header' => '',
                'buttons'=> [
                    'estudioView' => function ($url ,$modelEstudio) {
                        $url = Url::to(['estudioview','id'=> $modelEstudio->id_estudio]);
                        return Html::a('<span class="fa fa-pencil"></span>', $url,['title'=>'view']);                        
                    }/*,
                    'estudioUpdate' => function ($url ,$modelEstudio) {
                        $url = Url::to(['estudioupdate','id'=> $modelEstudio->id_estudio]);
                        return Html::a('<span class="fa fa-pencil"></span>', $url,['title'=>'view']);                        
                    },
                    'estudioDelete' => function ($url ,$modelEstudio) {
                        $url = Url::to(['estudiodelete','id'=> $modelEstudio->id_estudio]);
                        return Html::a('<span class="fa fa-trash-o"></span>', $url,['title'=>'view']);                        
                    }*/

                ]               
            ],
        ],
    ]); ?>
</div>

<!--    PUBLICACIONES   -->
<h3 align="center" > Publicaciones Realizados</h3>
    <p>
        <?= Html::a('Agregar Publicaciones', ['createpublicacion'], ['class' => 'btn btn-success']) ?>
    </p>
<div class="col-lg-11" style="position: relative;margin-left:45px; margin-right:15px; "> 

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

            [
                'class' => 'yii\grid\ActionColumn',
                'template' => ' {publicacionUpdate} {publicacionView} {publicacionDelete}',
                'header' => '',
                'buttons'=> [
                    'publicacionView' => function ($url ,$modelPublicacion) {
                        $url = Url::to(['publicacionview','id'=> $modelPublicacion->id_publicacion]);
                        return Html::a('<span class="fa fa-pencil"></span>', $url,['title'=>'view']);                        
                    }/*,
                    'publicacionUpdate' => function ($url ,$modelPublicacion) {
                        $url = Url::to(['publicacionupdate','id'=> $modelPublicacion->id_publicacion]);
                        return Html::a('<span class="fa fa-pencil"></span>', $url,['title'=>'view']);                        
                    },
                    'publicacionDelete' => function ($url ,$modelPublicacion) {
                        $url = Url::to(['publicaciondelete','id'=> $modelPublicacion->id_publicacion]);
                        return Html::a('<span class="fa fa-trash-o"></span>', $url,['title'=>'view']);                        
                    }*/

                ]               
            ],
        ],
    ]); ?>
</div>

</div>
