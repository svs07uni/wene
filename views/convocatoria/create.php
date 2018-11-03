<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Convocatoria */

$this->title = 'Create Convocatoria';
$this->params['breadcrumbs'][] = ['label' => 'Convocatorias', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="convocatoria-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
