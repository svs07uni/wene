
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
            <div class="col-sm-8"  > 
                <h2>
                    Introduzca la nueva contraseña
                </h2>
                <ul>
                </ul>
            
                </div>    
                <div class="col-sm-3" style="background-color: #d5f5e3 "> 
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
                    <!--        CAPTCHA         -->
                    <div> 
                        <?= $form->field($model, 'captcha')->widget(Captcha::className()) ?>
                    </div>

                    <div class="form-group">
                        <?= Html::submitButton('Guardar', ['class' => 'btn btn-primary', 'name'=> 'register-button' ]) ?>
                    </div>
                    
                </div>
                
            </div> 
            
        </div>
    </div>
    <?php ActiveForm::end(); ?>
</form>
</div><!-- registroView -->