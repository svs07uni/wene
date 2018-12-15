<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Experiencia */

$this->title = 'Nueva Experiencia';
$this->params['breadcrumbs'][] = ['label' => 'Experiencias', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="experiencia-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
