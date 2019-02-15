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

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            //'id_convocatoria',
            'titulo',
            'descripcion',
            'direccion',
        	//['attribute'=>'fecha_alta',
        	//		'format'=>['DateTime','php:d-m-Y']
        	//],
            
        	['attribute'=>'fecha_desde',
        			'format'=>['DateTime','php:d-m-Y']
        	],
        		
        	['attribute'=>'fecha_hasta',
        			'format'=>['DateTime','php:d-m-Y']
        		],
        	//'cant_postulantes',
            'activo:boolean',
            //'id_tipo',
            'tipo.nombre',
            //'id_sede_pedido',
            'sedePedido.nombre',
            'institucion.nombre',
            'requisitos',
        ],
    ]) ?>
</div>
