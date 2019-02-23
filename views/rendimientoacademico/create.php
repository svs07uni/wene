<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Rendimiento_acad */

$this->title = 'Create Rendimiento Acad';
$this->params['breadcrumbs'][] = ['label' => 'Rendimiento Acads', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="rendimiento-acad-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
