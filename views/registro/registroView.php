
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
<div class="jumbotron">
    <?php $form = ActiveForm::begin(); ?>
    
    
    
        <div class="col-xs-2">  
            <h4>Usuario: </h4>
            <?= $form->field($model, 'usuario') 
            ->label(false)
            ->textInput(['placeholder' => $model->getAttributeLabel('usuario')]) ?>
        </div> 
        <br>
            <br>
            <br>
            <br>
            <br>
             
        <div class="col-xs-2">  
            <h4>Contraseña: </h4>
            <?= $form->field($model, 'clave') 
            ->label(false)
            ->passwordInput()?>
        </div> 

        <div class="col-xs-2">  
            <h4>Repetir Contraseña: </h4>
            <?= $form->field($model, 'claveRepetida') 
            ->label(false)
            ->passwordInput()?>
        </div> 
        <br>
            <br>
            <br>
            <br><br><br>
            <br>
            
        <div class="col-xs-2">  
            <h4>Email: </h4>
            <?= $form->field($model, 'email') 
            ->label(false) ?>
        </div>  
        <br>
            <br>
            <br>
            <br>
            <br>
            
        <!--        CAPTCHA         -->
        <div class="col-xs-1">  
            <?= $form->field($model, 'captcha')->widget(Captcha::className()) ?>
        </div>
        
        <br>
        <div class="form-group">
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <?= Html::submitButton('Registrarse', ['class' => 'btn btn-primary', 'name'=> 'register-button' ]) ?>
        </div>
    </div> 
    <?php ActiveForm::end(); ?>
</div><!-- registroView -->