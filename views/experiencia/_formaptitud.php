<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Experiencia */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="experiencia-form">
    <div class="col-sm-8">
        <?php $form = ActiveForm::begin(); ?>

    

        <?= $form->field($model, 'tipo')->textInput() ?>

        <?= $form->field($model, 'nivel')->textInput() ?>

        <div class="form-group">
            <?= Html::submitButton('Guardar', ['class' => 'btn btn-success']) ?>
        </div>

    <?php ActiveForm::end(); ?>
    </div>
</div>
