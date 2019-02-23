<?php
/* @var $this yii\web\View */
/* @var $model app\models\Usuario */
/* @var $form ActiveForm */
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
//para la imagen de perfil
use yii\web\UploadedFile;
use yii\widgets\DetailView;
use yii\helpers\ArrayHelper;
?>
<div class="usuario">
<?php $provincias = \yii\helpers\ArrayHelper::map(\app\models\Provincia::find()->all(), 'id_provincia', 'nombre');?>
<?php $roles = \yii\helpers\ArrayHelper::map(\app\models\Rol::find()->all(), 'id_rol', 'nombre');?>    

<body>
<h3 align="center" > Datos Personales </h3>
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
                    <?= $form->field($model, 'id_provincia')->dropDownList($provincias, ['prompt' => 'Seleccione Uno', 'value' => $model->localidad->id_provincia, ])
                        ->label('Provincia')?>

                    <!-- Desplegable con las localidades-->
                    <?= $form->field($model, 'id_localidad')->widget(DepDrop::classname(), [
                        'options'=>['id'=>'id_localidad'],
                        'data'=>ArrayHelper::map(\app\models\Localidad::find()->where('id_provincia='.$model->localidad->id_provincia)->all(), 'id_localidad', 'nombre' ),
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
                        'clientOptions' => [
                            'autoclose' => true,
                            'format' => 'yyyy-mm-dd'
                        ]
                        
                    ]);?>
                    <div class="col-sm-6" >
                        <?=
                            DetailView::widget([
                                'model' => $model,
                                'attributes' => [
                                    [
                                        'attribute'=>'Imagen ',
                                        'value'=>'@web/uploads/'.$model->id_registro.'.png', 
                                        'format' => ['image',['width'=>'100','height'=>'140']],
                                    ],
                                ],
                            ]) 
                        ?>
                    </div>
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