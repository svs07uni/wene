
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

<?php
?>
    <?php $form = ActiveForm::begin(); ?>
    
    <div class="jumbotron jumbotron-fluid">
        <div> 
            <div class="container" style="background-color: #d5f5e3 ">
            <div class="col-sm-8"  style="background-color:  #d5f5e3  "> 
                <h2>
                    Escribe tu mail para recuperar tu contraseña
                </h2>
                <ul>
                </ul>
            
                </div>    
                <div class="col-sm-4" style="background-color: #d5f5e3 "> 
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
                        <?= Html::submitButton('Enviar', ['class' => 'btn btn-primary', 'name'=> 'register-button' ]) ?>
                    </div>
                </div>
                
            </div> 
            
        </div>
    </div>
    <?php ActiveForm::end(); ?>
</form>
</div><!-- registroView -->