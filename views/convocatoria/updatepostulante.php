<?php
use yii\widgets\ActiveForm;
use yii\helpers\Html;
use yii\widgets\DetailView;?>
<?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model->usuario, 'nombre')->textInput(['readonly'=> true,])->label('Nombre Postulante');
     ?>

    <?= $form->field($model->usuario, 'apellido')->textInput(['readonly'=> true,])
    ->label('Apellido Postulante') ?>

    <?= $form->field($model->estado, 'nombre')->textInput(['readonly'=> true,])
    ->label('Estado Postulante') ?>

 	<?= $form->field($model, 'orden_merito')-> textInput(['required'=>'true','integer'=>'true','value'<='100'])-> label('Orden de  Merito')?>
    
	<div class="form-group">
        <?= Html::submitButton('Guardar', ['class' => 'btn btn-success']) ?>
    </div>
	   
<?php ActiveForm::end(); ?>
