<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Usuario */
/* @var $form ActiveForm */
?>
<div class="usuario">

    <div class="col-sm-4">
    <?php $localidades = \yii\helpers\ArrayHelper::map(\app\models\Localidad::find()->all(), 'id_localidad', 'nombre');;?>
    <?php $roles = \yii\helpers\ArrayHelper::map(\app\models\Rol::find()->all(), 'id_rol', 'nombre');;?>
    <?php $form = ActiveForm::begin(); ?>
        
        <?= $form->field($model, 'dni') ?>
        <?= $form->field($model, 'nombre') ?>
        <?= $form->field($model, 'apellido') ?>
        <?= $form->field($model, 'nacionalidad') ?>
        <?= $form->field($model, 'direccion') ?>
        <?= $form->field($model, 'localidad')->dropDownList($localidades, ['prompt' => 'Seleccione Uno' ])?>
        <?= $form->field($model, 'fecha_nac') ?>

        <?= $form->field($model, 'rol')->dropDownList($roles, ['prompt' => 'Seleccione Uno' ]) ?>

        <?= $form->field($model, 'telefono') ?>
    
        <div class="form-group">
            <?= Html::submitButton('Submit', ['class' => 'btn btn-primary']) ?>
        </div>
    </div>
    <?php ActiveForm::end(); ?>
    
</div><!-- registroUsuario -->
