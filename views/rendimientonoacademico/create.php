<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Rendimiento_no_acad */

$this->title = 'Create Rendimiento No Acad';
$this->params['breadcrumbs'][] = ['label' => 'Rendimiento No Acads', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="rendimiento-no-acad-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
