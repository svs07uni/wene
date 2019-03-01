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
    
<?php if(isset($dataProviderCarrerasDest)){ ?>
   <?= GridView::widget([
        'dataProvider' => $dataProviderCarrerasDest,
        'layout' => '{items}',
        'columns' => [            
            ['label' => 'Carrera destinada',
                'attribute' => 'carrera.nombre'],
            ['label' => 'Años necesarios',
                'attribute' => 'anios_necesario'],
            ['label' => 'Cant. materias necesarias',
                'attribute' => 'cant_materias_nec'],
            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{delete}',
                'header' => 'Quitar',
                'buttons' => [
                            'delete' => function ($url, $model) {
                                return Html::a('<span class="glyphicon glyphicon-trash"></span>', $url, [
                                            'title' => Yii::t('app', 'lead-delete'),
                                ]);
                            }
                    ],
                'urlCreator' => function ($action, $model, $key, $index) {
                                        if ($action === 'delete') {
                                            $url ='?d='.$model->id_carrera;
                                            return $url;
                                        }
                                 }
            ],
        ],
    ]); ?>

    <div class="panel panel-info">
        <div class="panel-heading">
            Agregar carrera necesaria
        </div>
        <div class="panel-body">
            <?= $form->field($model, 'unaCarreraDest')
                        ->dropDownList($carreras, ['prompt' => 'Seleccione ...' ])
                        ->label('Carrera')?>
            <?= $form->field($model, 'unaCarreraDestAnios')
                        ->label('Años necesarios en carrera')?>
            <?= $form->field($model, 'unaCarreraDestMaterias')
                        ->label('Cant. de materias necesarias')?>
            <div class="form-group">
                <?= Html::submitButton('Agregar carrera', ['class' => 'btn btn-success', 'name' => 'agregar']) ?>
            </div>
        </div>
    </div>
<?php } ?>

    <?= $form->field($model, 'titulo')->textInput() 
    ->label('Nombre convocatoria') ?>

    <?= $form->field($model, 'descripcion')->textInput() ?>

    <?= $form->field($model, 'direccion')->textInput() ->label('Direccion de la Empresa')?>

 	<?= $form->field($model, 'fecha_desde')->label("Periodo de publicación")->widget(DateRangePicker::className(), [
    'attributeTo' => 'fecha_hasta',
    'labelTo' => 'hasta',
 	  'form' => $form, // best for correct client validation
    'language' => 'es',
    'size' => 'lg',
 	'clientOptions' => [
        'autoclose' => true,
    	'format' => 'dd-mm-yyyy',
 	 ]
 		
	]);?>
	   

  
    <?= $form->field($model, 'cant_postulantes')->textInput() ?>

    <?php $datos_tipo= \yii\helpers\ArrayHelper::map(\app\models\Tipo::find()->all(), 'id_tipo', 'nombre');?>
    <?= $form->field($model, 'id_tipo')->dropDownList($datos_tipo, ['prompt' => 'Seleccione ...' ])->label('Tipo de la convocatoria')?>
     
     
    
	<?php $datos_sede= \yii\helpers\ArrayHelper::map(\app\models\Sede::find()->all(), 'id_sede', 'nombre');?>
	<?= $form->field($model, 'id_sede_pedido')->dropDownList($datos_sede, ['prompt' => 'Seleccione ...' ])->label('Sede de la convocatoria')?>
    
    
    <?php $datos_institucion= \yii\helpers\ArrayHelper::map(\app\models\Institucion::find()->all(), 'id_institucion', 'nombre');?>
    <?= $form->field($model, 'id_institucion')->dropDownList($datos_institucion, ['prompt' => 'Seleccione ...' ])->label('Institucion')?>
    
       
   <?= $form->field($model, 'requisitos')->textInput() ?>


    <div class="form-group">
        <?= Html::submitButton('Guardar', ['class' => 'btn btn-success pull-right']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
