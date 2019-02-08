<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Experiencia */

$this->title = $model->titulo;
$this->params['breadcrumbs'][] = ['label' => 'Experiencias', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="experiencia-view">

    <h1><?= Html::encode($this->title) ?></h1>
    <br>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            //'id_experiencia',
            //'id_usuario',
            'titulo',
            'descripcion',
        ],
    ]) ?>


<p>
        <?= Html::a('Modificar', ['update', 'id' => $model->id_experiencia], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Eliminar', ['delete', 'id' => $model->id_experiencia], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

</div>
