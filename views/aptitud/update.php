<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Aptitud */

$this->title = 'Update Aptitud: ' . $model->id_aptitud;
$this->params['breadcrumbs'][] = ['label' => 'Aptituds', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_aptitud, 'url' => ['view', 'id' => $model->id_aptitud]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="aptitud-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
