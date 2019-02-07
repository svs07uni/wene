<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Institucion */

$this->title = $model->nombre;
$this->params['breadcrumbs'][] = ['label' => 'Institucion', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="institucion-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Actualizar', ['update', 'id' => $model->id_institucion], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Borrar', ['delete', 'id' => $model->id_institucion], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Esta seguro/a que desea borrar esta institucion ?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id_institucion',
            //'nombre',
            'email:email',
            'telefono',
            'direccion',
        ],
    ]) ?>

</div>
