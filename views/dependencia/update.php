<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Dependencia */

$this->title = 'Update Dependencia: ' . $model->id_dependencia;
$this->params['breadcrumbs'][] = ['label' => 'Dependencias', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_dependencia, 'url' => ['view', 'id' => $model->id_dependencia]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="dependencia-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
