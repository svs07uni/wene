<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $model app\models\Convocatoria */

$this->title = $model->titulo;
$this->params['breadcrumbs'][] = ['label' => 'Convocatorias', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="convocatoria-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Actualizar', ['update', 'id' => $model->id_convocatoria], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Borrar', ['delete', 'id' => $model->id_convocatoria], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Esta seguro de borrar?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id_convocatoria',
            'titulo',
            'descripcion',
            'direccion',
        	['attribute'=>'fecha_alta',
        			'format'=>['DateTime','php:d-m-Y']
        	],
            
        	['attribute'=>'fecha_desde',
        			'format'=>['DateTime','php:d-m-Y']
        	],
        		
        	['attribute'=>'fecha_hasta',
        			'format'=>['DateTime','php:d-m-Y']
        		],
        	'cant_postulantes',
            'activo:boolean',
            //'id_tipo',
            'tipo.nombre',
            //'id_sede_pedido',
            'sedePedido.nombre',
            'institucion.nombre',
            'requisitos',
        ],
    ]) ?>
<h2>Postulantes</h2>
 <?= GridView::widget([
        'dataProvider' => $dataProvider,
 		'layout' => '{items}',
       // 'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

           // 'id_postulante',
            //'id_usuario',
            //'id_convocatoria',
            //'fecha_postulado',
            //'id_estado',
            'usuario.nombre',
        	'usuario.apellido',
        	'usuario.telefono',
        	//'usuario.direccion',
            'usuario.localidad.nombre',
        	'estado.nombre',
            'orden_merito',
        		['class' => 'yii\grid\ActionColumn',
        				'buttons' => [
        						'additional_icon' => function ($url, $model, $key) {
        						return Html::a ( '<span class=" glyphicon glyphicon-random" aria-hidden="true"></span> ', ['convocatoria/updatepostulante', 'id_convocatoria' => $model->id_convocatoria,'id_postulante' => $model->id_postulante],['title' => "mostrar"] );
 },
 ],
 'template' => '{additional_icon}'
   ],
   
   // CODIGO AGREGADO
   
 ['class' => 'yii\grid\ActionColumn',
 		'buttons' => [
 				'additional_icon' => function ($url, $model, $key) {
 				return Html::a ( '<span class="glyphicon fa fa-address-card-o" aria-hidden="true"></span> ', ['//usuario/perfil', 'id'=>$model->usuario->id_registro],['title' => "CV"]);
 },
 ],
 'template' => '{additional_icon}'
            		],
            		
 
 
 
 
 	// FIN DE CODIGO AGREGADO
   
   

        ],
    ]); ?>
</div>
