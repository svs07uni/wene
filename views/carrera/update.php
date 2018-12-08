<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Carrera */

$this->title = 'Update Carrera: ' . $model->id_carrera;
$this->params['breadcrumbs'][] = ['label' => 'Carreras', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_carrera, 'url' => ['view', 'id' => $model->id_carrera]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="carrera-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
