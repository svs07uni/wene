<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\depdrop\DepDrop;
use yii\grid\GridView;
use yii\helpers\Url;
use dosamigos\datepicker\DatePicker;
/* @var $this yii\web\View */
/* @var $model app\models\Usuario */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="usuario-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($modelUsr, 'dni')->textInput(['readonly'=> true]) ?>

    <?= $form->field($modelUsr, 'apellido')->textInput(['readonly'=> true]) ?>

    <?= $form->field($modelUsr, 'nombre')->textInput(['readonly'=> true]) ?>

    <?= GridView::widget([
        'dataProvider' => $dataProviderAbarca,
        'layout' => '{items}',
        'columns' => [            
            ['label' => 'Gestiona',
                'attribute' => 'nombre'],
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
                                            $url ='?d='.$model->id_dependencia;
                                            return $url;
                                        }
                                 }
            ],
        ],
    ]); ?>

    <div class="panel panel-info">
        <div class="panel-heading">
            Agregar dependencia a gestionar
        </div>
        <div class="panel-body">
            <?= $form->field($model, 'id_dependencia')
                        ->dropDownList($dependencias, ['prompt' => 'Seleccione ...' ])
                        ->label('Dependencia')?>
            <div class="form-group">
                <?= Html::submitButton('Agregar', ['class' => 'btn btn-success']) ?>
            </div>
        </div>
    </div>
    <?php ActiveForm::end(); ?>

</div>
