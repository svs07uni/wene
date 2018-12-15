<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
//para el date picker
use dosamigos\datepicker\DatePicker;
use dosamigos\datepicker\DateRangePicker;
/* @var $this yii\web\View */
/* @var $model app\models\Estudio */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="experiencia-form">
    <div class="col-sm-8">
        <?php $form = ActiveForm::begin(); ?>

    

        <?= $form->field($model, 'titulo')->textInput() ?>
        <?= $form->field($model, 'institucion')->textInput() ?>
        <!-- Desplegable de fecha -->
        <?= $form->field($model, 'fecha_egreso')->widget(DatePicker::className(), [
                        'inline' => false, 
                        'size' => '4',
                        'language' => 'es',
                    ]);?>

        <div class="form-group">
            <?= Html::submitButton('Guardar', ['class' => 'btn btn-success']) ?>
        </div>

    <?php ActiveForm::end(); ?>
    </div>
</div>
