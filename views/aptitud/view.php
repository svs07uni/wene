<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Aptitud */

$this->title = $model->id_aptitud;
$this->params['breadcrumbs'][] = ['label' => 'Aptitud', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
//print_r($id);
//exit();
?>
<div class="aptitud-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Actualizar', ['//aptitud/update', 'id' => $model->id_aptitud], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Borrar', ['//aptitud/delete', 'id' => $model->id_aptitud], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Esta seguro/a que desea borrar esta aptitud?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            //'id_aptitud',
            'tipo',
            'nivel',
            'usuario.nombre',
        	'usuario.apellido',
        ],
    ]) ?>

</div>
