<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\EstudioSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="estudio-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id_estudio') ?>

    <?= $form->field($model, 'id_institucion') ?>

    <?= $form->field($model, 'fecha_egreso') ?>

    <?= $form->field($model, 'id_tipo') ?>

    <?= $form->field($model, 'titulo') ?>

    <?php // echo $form->field($model, 'id_usuario') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
