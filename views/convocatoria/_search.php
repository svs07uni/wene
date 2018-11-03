<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\ConvocatoriaSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="convocatoria-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id_convocatoria') ?>

    <?= $form->field($model, 'titulo') ?>

    <?= $form->field($model, 'descripcion') ?>

    <?= $form->field($model, 'direccion') ?>

    <?= $form->field($model, 'fecha_alta') ?>

    <?php // echo $form->field($model, 'fecha_desde') ?>

    <?php // echo $form->field($model, 'fecha_hasta') ?>

    <?php // echo $form->field($model, 'cant_postulantes') ?>

    <?php // echo $form->field($model, 'activo')->checkbox() ?>

    <?php // echo $form->field($model, 'id_tipo') ?>

    <?php // echo $form->field($model, 'id_sede_pedido') ?>

    <?php // echo $form->field($model, 'id_institucion') ?>

    <?php // echo $form->field($model, 'requisitos') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
