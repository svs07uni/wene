<?php
use yii\widgets\ActiveForm;
use yii\helpers\Html;
use yii\widgets\DetailView;?>
<?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model->usuario, 'nombre')->textInput() 
    ->label('Nombre Postulante') ?>

    <?= $form->field($model->usuario, 'apellido')->textInput()
    ->label('Apellido Postulante') ?>

    <?= $form->field($model->estado, 'nombre')->textInput()
    ->label('Estado Postulante') ?>

 	<?= $form->field($model, 'orden_merito')->dropDownList([1=>1,2=>2,3=>3,4=>4,5=>5])->label('Orden de  Merito')?>
    
	<div class="form-group">
        <?= Html::submitButton('Guardar', ['class' => 'btn btn-success']) ?>
    </div>
	   
<?php ActiveForm::end(); ?>
