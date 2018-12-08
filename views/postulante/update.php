<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Postulante */

$this->title = 'Update Postulante: ' . $model->id_postulante;
$this->params['breadcrumbs'][] = ['label' => 'Postulantes', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_postulante, 'url' => ['view', 'id' => $model->id_postulante]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="postulante-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
