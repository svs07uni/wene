<?php
use aryelds\sweetalert\SweetAlert;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Usuario */
/* @var $form ActiveForm */
?>
<div class="usuario">
<?php $localidades = \yii\helpers\ArrayHelper::map(\app\models\Localidad::find()->all(), 'id_localidad', 'nombre');;?>
<?php $roles = \yii\helpers\ArrayHelper::map(\app\models\Rol::find()->all(), 'id_rol', 'nombre');?>    
<?php $usrActual = Yii::$app->user->identity;?>
<div class="jumbotron jumbotron-fluid">
        <div> 
            <div class="container" style="background-color: #d5f5e3 ">
            <div class="col-sm-6"  style="background-color:  #d5f5e3  "> 
                <h2>
                    Necesitamos conocerte mejor!
                </h2>
                <br>
                <h4>
                A fin de que puedas postularte a las convocatorias son necesarios estos datos.
                </h4>
                </div>    
                <div class="col-sm-5" style="background-color: #d5f5e3 "> 
                    
                    <?php $form = ActiveForm::begin(); ?>
                    <?= $form->field($model, 'dni') ?>
                    <?= $form->field($model, 'nombre') ?>
                    <?= $form->field($model, 'apellido') ?>
                    <?= $form->field($model, 'nacionalidad') ?>
                    <?= $form->field($model, 'direccion') ?>
                    <!-- Desplegable con las localidades-->
                    <?= $form->field($model, 'id_localidad')->dropDownList($localidades, ['prompt' => 'Seleccione Uno' ])
                        ->label('Localidad')?>
                    <?= $form->field($model, 'fecha_nac') 
                        ->label('Fecha de Nacimiento')?>
                    <!-- Desplegable con los posibles roles-->
                    <?= $form->field($model, 'id_rol')->dropDownList($roles, ['prompt' => 'Seleccione Uno' ]) 
                        ->label('Rol')?>
                    <?= $form->field($model, 'telefono') ?>
                    <div class="form-group">
                        <?= Html::submitButton('Guardar', ['class' => 'btn btn-primary']) ?>
                    </div>
                    <?php ActiveForm::end(); ?>
                </div>
                
            </div> 
            
        </div>
    </div>
</div><!-- registroUsuario -->
