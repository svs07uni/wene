<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Abarca */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="abarca-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'id_abarca')->textInput() ?>

    <?= $form->field($model, 'id_dependencia')->textInput() ?>

    <?= $form->field($model, 'id_usuario')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
