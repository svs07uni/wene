<?php
// para los modals de notificacion
use aryelds\sweetalert\SweetAlert;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

//para el date picker
use dosamigos\datepicker\DatePicker;
use dosamigos\datepicker\DateRangePicker;
//para el dropdown dependiente
use yii\helpers\Url;
use kartik\depdrop\DepDrop;
use yii\web\UploadedFile;
/* @var $this yii\web\View */
/* @var $model app\models\Usuario */
/* @var $form ActiveForm */
?>
<div class="usuario">
<?php $provincias = \yii\helpers\ArrayHelper::map(\app\models\Provincia::find()->all(), 'id_provincia', 'nombre');?>
<?php $roles = \yii\helpers\ArrayHelper::map(\app\models\Rol::find()->all(), 'id_rol', 'nombre');?>    
<?php $usrActual = Yii::$app->user->identity;?>
<body>
<h3 align="center" > Modificación de datos Personales </h3>
        <div> 
            <div class="container" >
                <div class="col-sm-5"> 
                    
                    <?php $form = ActiveForm::begin(); ?>
                    <?= $form->field($model, 'id_registro')->hiddenInput()->label(false) ?>
                
                    <?= $form->field($model, 'nombre') ?>
                    <?= $form->field($model, 'apellido') ?>
                
                    <?= $form->field($model, 'nacionalidad') ?>
                    <?= $form->field($model, 'direccion') ?>
                    <?= $form->field($model, 'foto')->fileInput() ?>
                </div>
                <br>

                <div class="col-sm-5" > 
                    <!-- Desplegable con las provincias-->
                    <?= $form->field($model, 'id_provincia')->dropDownList($provincias, ['prompt' => 'Seleccione Uno' ])
                        ->label('Provincia')?>

                    <!-- Desplegable con las localidades-->
                    <?= $form->field($model, 'id_localidad')->widget(DepDrop::classname(), [
                        'options'=>['id'=>'id_localidad'],
                        'pluginOptions'=>[
                        'depends'=>['usuario-id_provincia'],
                        'placeholder'=>'Seleccione',
                        'url'=>Url::to(['/usuario/localidades'])
                        ]
                    ])
                    ->label('Localidad'); ?>


                    <?= $form->field($model, 'telefono') ?>
                    <!-- Desplegable de fecha -->
                    <?= $form->field($model, 'fecha_nac')->widget(DatePicker::className(), [
                        'inline' => false, 
                        'size' => '4',
                        'language' => 'es',
                        /*'clientOptions' => [
                            'autoclose' => true,
                            'format' => 'dd-mm-yyyy'
                        ]
                        */
                    ]);?>
                    </div>
<br><br><br><br><br><br><br><br><br><br><br>
                    <div class="col-sm-12" style="align=center"> 
                        <div class="form-group">
                            <?= Html::submitButton('Guardar', ['class' => 'btn btn-primary']) ?>
                        </div>
                    </div>
                    <?php ActiveForm::end(); ?>
                </div>
                
            </div> 
            
        </div>
    </div>
</body>