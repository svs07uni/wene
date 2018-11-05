<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Registro */
/* @var $form ActiveForm */

/**
     * @var string
     
    public $captcha;
    /**
     * @inheritdoc
     
    public function rules()
    {
        $rules = parent::rules();
        $rules[] = ['captcha', 'required'];
        $rules[] = ['captcha', 'captcha'];
        return $rules;
    }
*/
?>
<div class="registroView">

    <?php $form = ActiveForm::begin(); ?>
    <div class="col-xs-4"> 
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
        <?= $form->field($model, 'clave') 
        ->label(false)
        ->passwordInput()?>
        </div> 

        <div> 
        <h4>Email: </h4>
        <?= $form->field($model, 'email') 
        ->label(false) ?>
        </div> 

        <div> 
        <br> 
        <h4>Captcha: </h4>

        </div>
        <br> 
        <div class="form-group">
            <?= Html::submitButton('Registrarse', ['class' => 'btn btn-primary', 'name'=> 'login-button' ]) ?>
        </div>
    </div> 
    <?php ActiveForm::end(); ?>

</div><!-- registroView -->
