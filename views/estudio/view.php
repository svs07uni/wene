<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Estudio */

$this->title = $model->id_estudio;
$this->params['breadcrumbs'][] = ['label' => 'Estudios', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<p>
        <?= Html::a('Actualizar', ['//estudio/update', 'id' => $model->id_estudio], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Borrar', ['//estudio/delete', 'id' => $model->id_estudio], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Esta seguro de borrar?',
                'method' => 'post',
            ],
        ]) ?>
    </p>
<div class="estudio-view">

    <h1><?= Html::encode("Estudio Realizado") ?></h1>


    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            //'id_estudio',
            //'id_institucion',
            'fecha_egreso',
            //'id_tipo',
            'titulo',
            //'id_usuario',
        ],
    ]) ?>

</div>
