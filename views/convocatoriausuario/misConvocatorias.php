<?php

use yii\helpers\Html;
use yii\grid\GridView;

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
            'institucion.nombre',
            'titulo',
            'direccion',
            'fecha_alta',
            //'fecha_desde',
            'fecha_hasta',
            //'cant_postulantes',
            'activo:boolean',
            //'id_tipo',
            //'id_sede_pedido',
            //'id_institucion',
            //'requisitos',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>