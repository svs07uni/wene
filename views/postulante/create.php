<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Postulante */

$this->title = 'Create Postulante';
$this->params['breadcrumbs'][] = ['label' => 'Postulantes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="postulante-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
