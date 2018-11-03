<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
/* @var $this yii\web\View */
/* @var $model app\models\Usuario */
/* @var $form ActiveForm */
?>
<div class="registroView">


    <div>
        <h2>Registro de Usuarios</h2>
    </div>
    <?php $form = ActiveForm::begin(); ?>
    <span>
        <?= $form->field($model, 'dni')?>
        <?= $form->field($model, 'nombre') ?>
        <?= $form->field($model, 'apellido') ?>
        <?= $form->field($model, 'nacionalidad') ?>
        <?= $form->field($model, 'fecha_nac') ?>
    </span>
        <div class="form-group">
            <?= Html::submitButton('Submit', ['class' => 'btn btn-primary', 'name' => 'registro-button']) ?>
        </div>
    <?php ActiveForm::end(); ?>

</div><!-- registroView -->
