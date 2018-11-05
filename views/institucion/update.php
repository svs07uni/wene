<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Institucion */

$this->title = 'Update Institucion: ' . $model->id_institucion;
$this->params['breadcrumbs'][] = ['label' => 'Institucions', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_institucion, 'url' => ['view', 'id' => $model->id_institucion]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="institucion-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
