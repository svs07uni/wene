<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Usuario */

$this->title = 'Editar '.$model->rol->nombre.' n° ' . $model->id_registro;
$this->params['breadcrumbs'][] = ['label' => 'Gestores', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_registro, 'url' => ['view', 'id' => $model->id_registro]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="usuario-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'modelUsr' => $model,
        'model' => $modelDep, 
        'dependencias' => $dependencias,
        'dataProviderAbarca' => $dataProviderAbarca
    ]) ?>

</div>
