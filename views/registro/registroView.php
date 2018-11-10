
<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\captcha\Captcha;

/* @var $this yii\web\View */
/* @var $model app\models\Registro */
/* @var $form ActiveForm */

/**
     * @var string
     */

?>
<div class="registroView">

    <?php $form = ActiveForm::begin(); ?>
    <div class="jumbotron jumbotron-fluid">
    <div class="container" style="background-color:red">
    <div class="col-sm-4"  style="background-color:blue"> 
        <div > 
            <h4>Usuario: </h4>
            <?= $form->field($model, 'usuario') 
            ->label(false)
            ->textInput(['placeholder' => $model->getAttributeLabel('usuario')]) ?>
        </div> 

        <div> 
            <h4>Contraseña: </h4>
            <?= $form->field($model, 'clave') 
            ->label(false)
            ->passwordInput()?>
        </div> 

        <div> 
            <h4>Repetir Contraseña: </h4>
            <?= $form->field($model, 'claveRepetida') 
            ->label(false)
            ->passwordInput()?>
        </div> 

        <div> 
            <h4>Email: </h4>
            <?= $form->field($model, 'email') 
            ->label(false) ?>
        </div> 
        
        <!--        CAPTCHA         -->
        <div> 
            <?= $form->field($model, 'captcha')->widget(Captcha::className()) ?>
        </div>

        <div class="form-group">
            <?= Html::submitButton('Registrarse', ['class' => 'btn btn-primary', 'name'=> 'register-button' ]) ?>
        </div>
        </div>
        </div>
    </div> 
    <?php ActiveForm::end(); ?>

</div><!-- registroView -->