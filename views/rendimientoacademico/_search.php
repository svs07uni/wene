<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Rendimiento_acadSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="rendimiento-acad-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id_rendimiento') ?>

    <?= $form->field($model, 'id_usuario') ?>

    <?= $form->field($model, 'fecha_actualizado') ?>

    <?= $form->field($model, 'cant_mat_aprobadas') ?>

    <?= $form->field($model, 'anio_carrera') ?>

    <?php // echo $form->field($model, 'legajo') ?>

    <?php // echo $form->field($model, 'fecha_egreso') ?>

    <?php // echo $form->field($model, 'id_carrera') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
