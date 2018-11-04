<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Estudio */

$this->title = 'Update Estudio: ' . $model->id_estudio;
$this->params['breadcrumbs'][] = ['label' => 'Estudios', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_estudio, 'url' => ['view', 'id' => $model->id_estudio]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="estudio-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
