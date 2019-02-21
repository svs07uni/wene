<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Rendimiento_acad */

$this->title = $model->id_rendimiento;
$this->params['breadcrumbs'][] = ['label' => 'Rendimiento Acads', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="rendimiento-acad-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id_rendimiento], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id_rendimiento], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id_rendimiento',
            'id_usuario',
            'fecha_actualizado',
            'cant_mat_aprobadas',
            'anio_carrera',
            'legajo',
            'fecha_egreso',
            'id_carrera',
        ],
    ]) ?>

</div>
