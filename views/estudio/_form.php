<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

use dosamigos\datepicker\DatePicker;
use dosamigos\datepicker\DateRangePicker;
/* @var $this yii\web\View */
/* @var $model app\models\Estudio */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="estudio-form">
    
    <?php $form = ActiveForm::begin(); ?>
    <!-- Desplegable de fecha -->
    <?= $form->field($model, 'fecha_egreso')->widget(DatePicker::className(), [
                        'inline' => false, 
                        'size' => 'lg',
                        'language' => 'es',
                        /*'clientOptions' => [
                            'autoclose' => true,
                            'format' => 'dd-M-yyyy',
                        ]*/
    ]);?>

    <?= $form->field($model, 'titulo')->textInput() ?>
    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
