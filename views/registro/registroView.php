<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Registro */
/* @var $form ActiveForm */
?>
<div class="registroView">

    <?php $form = ActiveForm::begin(); ?>

        <?= $form->field($model, 'usuario') ?>
        <?= $form->field($model, 'clave') ?>
        <?= $form->field($model, 'clave') ?>
        <?= $form->field($model, 'email') ?>
    
        <div class="form-group">
            <?= Html::submitButton('Registrarse', ['class' => 'btn btn-primary', 'name'=> 'login-button' ]) ?>
        </div>
    <?php ActiveForm::end(); ?>

</div><!-- registroView -->
