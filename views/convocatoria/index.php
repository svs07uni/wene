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

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Convocatoria', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id_convocatoria',
            'titulo',
            'descripcion',
            'direccion',
            'fecha_alta',
            //'fecha_desde',
            //'fecha_hasta',
            //'cant_postulantes',
            //'activo:boolean',
            //'id_tipo',
            //'id_sede_pedido',
            //'id_institucion',
            //'requisitos',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
