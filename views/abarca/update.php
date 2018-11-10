<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Abarca */

$this->title = 'Update Abarca: ' . $model->id_abarca;
$this->params['breadcrumbs'][] = ['label' => 'Abarcas', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_abarca, 'url' => ['view', 'id' => $model->id_abarca]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="abarca-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
