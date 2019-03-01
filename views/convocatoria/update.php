<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Convocatoria */

$this->title = 'Convocatoria: ' . $model->titulo;
$this->params['breadcrumbs'][] = ['label' => 'Convocatorias', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_convocatoria, 'url' => ['view', 'id' => $model->id_convocatoria]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="convocatoria-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        	'model' => $model,
            'carreras' => $carreras,
            'dataProviderCarrerasDest' => $dataProviderCarrerasDest
    ]) ?>

</div>
