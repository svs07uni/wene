<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Rendimiento_no_acad */

$this->title = $model->id_rendimiento;
$this->params['breadcrumbs'][] = ['label' => 'Rendimiento No Acads', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="rendimiento-no-acad-view">

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
            'titulo',
            'descripcion',
            'observacion',
            'id_rol',
            'horas_semanales',
            'fecha_inicio',
            'fecha_fin',
            'norma_legal',
            'id_tipo',
        ],
    ]) ?>

</div>
