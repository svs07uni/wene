<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Rendimiento No Acads';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="rendimiento-no-acad-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Rendimiento No Acad', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            //'id_rendimiento',
            //'id_usuario',
            'titulo',
            'descripcion',
            'observacion',
            'fecha_actualizado',
            //'id_rol',
            //'horas_semanales',
            'fecha_inicio',
            'fecha_fin',
            //'norma_legal',
            //'id_tipo',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
