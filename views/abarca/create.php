<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Abarca */

$this->title = 'Create Abarca';
$this->params['breadcrumbs'][] = ['label' => 'Abarcas', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="abarca-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
