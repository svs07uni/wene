<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Institucion */

$this->title = 'Create Institucion';
$this->params['breadcrumbs'][] = ['label' => 'Institucions', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="institucion-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
