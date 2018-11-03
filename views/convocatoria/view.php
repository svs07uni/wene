<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Convocatoria */

$this->title = $model->id_convocatoria;
$this->params['breadcrumbs'][] = ['label' => 'Convocatorias', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="convocatoria-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id_convocatoria], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id_convocatoria], [
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
            'id_convocatoria',
            'titulo',
            'descripcion',
            'direccion',
            'fecha_alta',
            'fecha_desde',
            'fecha_hasta',
            'cant_postulantes',
            'activo:boolean',
            'id_tipo',
            'id_sede_pedido',
            'id_institucion',
            'requisitos',
        ],
    ]) ?>

</div>
