<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Experiencia */

$this->title = 'Modificar Experiencia Laboral: ' . $model->titulo;
$this->params['breadcrumbs'][] = ['label' => 'Experiencias', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_experiencia, 'url' => ['view', 'id' => $model->id_experiencia]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="experiencia-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
