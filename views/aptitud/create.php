<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Aptitud */

$this->title = 'Create Aptitud';
$this->params['breadcrumbs'][] = ['label' => 'Aptituds', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="aptitud-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
