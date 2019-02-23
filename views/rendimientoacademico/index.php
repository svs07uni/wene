<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Rendimiento Acads';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="rendimiento-acad-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Rendimiento Acad', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            //'id_rendimiento',
            //'id_usuario',
            'fecha_actualizado',
            'cant_mat_aprobadas',
            'anio_carrera',
            //'legajo',
            'fecha_egreso',
            //'id_carrera',
            'carrera.nombre',
            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
