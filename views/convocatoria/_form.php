<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\grid\GridView;

use dosamigos\datepicker\DatePicker;
use dosamigos\datepicker\DateRangePicker;






/* @var $this yii\web\View */
/* @var $model app\models\Convocatoria */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="convocatoria-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'titulo')->textInput() 
    ->label('Nombre convocatoria') ?>

    <?= $form->field($model, 'descripcion')->textInput() ?>

    <?= $form->field($model, 'direccion')->textInput() ?>

 	<?= $form->field($model, 'fecha_desde')->widget(DateRangePicker::className(), [
    'attributeTo' => 'fecha_hasta', 
    'form' => $form, // best for correct client validation
    'language' => 'es',
    'size' => 'lg',
    'clientOptions' => [
        'autoclose' => true,
        'format' => 'dd-M-yyyy'
    ]
	]);?>
	   

  
    <?= $form->field($model, 'cant_postulantes')->textInput() ?>

    <?= $form->field($model, 'activo')->checkbox() ?>

    <?php $datos_tipo= \yii\helpers\ArrayHelper::map(\app\models\Tipo::find()->all(), 'id_tipo', 'nombre');?>
    <?= $form->field($model, 'id_tipo')->dropDownList($datos_tipo)->label('Tipo de la convocatoria')?>
     
     
    
	<?php $datos_sede= \yii\helpers\ArrayHelper::map(\app\models\Sede::find()->all(), 'id_sede', 'nombre');?>
	<?= $form->field($model, 'id_sede_pedido')->dropDownList($datos_sede)->label('Sede de la convocatoria')?>
    
    
    <?php $datos_institucion= \yii\helpers\ArrayHelper::map(\app\models\Institucion::find()->all(), 'id_institucion', 'nombre');?>
    <?= $form->field($model, 'id_institucion')->dropDownList($datos_institucion)->label('Institucion')?>
    
       
   <?= $form->field($model, 'requisitos')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
