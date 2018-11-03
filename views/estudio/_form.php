<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Estudio */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="estudio-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'id_institucion')->textInput() ?>

    <?= $form->field($model, 'fecha_egreso')->textInput() ?>

    <?= $form->field($model, 'id_tipo')->textInput() ?>

    <?= $form->field($model, 'titulo')->textInput() ?>

    <?= $form->field($model, 'id_usuario')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
