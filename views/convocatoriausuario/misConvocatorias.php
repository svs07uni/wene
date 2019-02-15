<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\Url;
/* @var $this yii\web\View */
/* @var $searchModel app\models\ConvocatoriaSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Convocatorias';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="convocatoria-index">

    
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <br>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            ['attribute'=>'institucion',
             'value'=> 'institucion.nombre' ],
            'titulo',
            'direccion',
            //'fecha_alta',
            //'fecha_hasta',
            ['attribute'=>'fecha_hasta',
        			'format'=>['DateTime','php:d-m-Y']
        		],
            'activo:boolean',
            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{convocatoriaUpdate} {convocatoriaView}   {convocatoriaDelete}' ,
                'header' => '',
                'buttons'=> [
                    'convocatoriaView' => function ($url ,$modelConvocatoria) {
                        $url = Url::to(['convocatoriausuario/vermas','id_convocatoria'=> $modelConvocatoria->id_convocatoria]);
                        return Html::a('<span class="fa fa-search"></span>', $url,['title'=>'Detalles']);                        
                    },
                    /*'convocatoriaUpdate' => function ($url ,$modelConvocatoria) {
                        $url = Url::to(['convocatoriaupdate','id'=> $modelConvocatoria->id_convocatoria]);
                        return Html::a('<span class="fa fa-pencil"></span>', $url,['title'=>'view']);                        
                    },*/
                    'convocatoriaDelete' => function ($url ,$modelConvocatoria) {
                        $url = Url::to(['convocatoriausuario/despostularse','id_convocatoria'=> $modelConvocatoria->id_convocatoria]);
                        return Html::a('<span class="fa fa-trash"></span>', $url,['title'=>'Eliminar']);                        
                    }
                ]               
            ],
        ],
    ]); ?>
</div>