<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Usuario */
/* @var $form ActiveForm */
?>
<div class="registroUsuario">

    <?php $form = ActiveForm::begin(); ?>

        <?= $form->field($model, 'id_registro') ?>
        <?= $form->field($model, 'dni') ?>
        <?= $form->field($model, 'nombre') ?>
        <?= $form->field($model, 'apellido') ?>
        <?= $form->field($model, 'nacionalidad') ?>
        <?= $form->field($model, 'direccion') ?>
        <?= $form->field($model, 'id_localidad') ?>
        <?= $form->field($model, 'fecha_nac') ?>
        <?= $form->field($model, 'id_rol') ?>
        <?= $form->field($model, 'telefono') ?>
    
        <div class="form-group">
            <?= Html::submitButton('Submit', ['class' => 'btn btn-primary']) ?>
        </div>
    <?php ActiveForm::end(); ?>

</div><!-- registroUsuario -->
