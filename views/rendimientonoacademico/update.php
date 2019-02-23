<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Rendimiento_no_acad */

$this->title = 'Update Rendimiento No Acad: ' . $model->id_rendimiento;
$this->params['breadcrumbs'][] = ['label' => 'Rendimiento No Acads', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_rendimiento, 'url' => ['view', 'id' => $model->id_rendimiento]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="rendimiento-no-acad-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
