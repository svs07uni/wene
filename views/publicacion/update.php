<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Publicacion */

$this->title = 'Update Publicacion: ' . $model->id_publicacion;
$this->params['breadcrumbs'][] = ['label' => 'Publicacions', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_publicacion, 'url' => ['view', 'id' => $model->id_publicacion]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="publicacion-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
