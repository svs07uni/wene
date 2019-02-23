<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Rendimiento_acad */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="rendimiento-acad-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'id_usuario')->textInput() ?>

    <?= $form->field($model, 'fecha_actualizado')->textInput() ?>

    <?= $form->field($model, 'cant_mat_aprobadas')->textInput() ?>

    <?= $form->field($model, 'anio_carrera')->textInput() ?>

    <?= $form->field($model, 'legajo')->textInput() ?>

    <?= $form->field($model, 'fecha_egreso')->textInput() ?>

    <?= $form->field($model, 'id_carrera')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
