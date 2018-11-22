
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
                    El trabajo que buscas <strong>está en WENE</strong>
                </h2>
                <ul>
                <h4>
                    <br>    
                    <li>Postúlate a las mejores ofertas</li>
                    <br>
                    <li>Sé visible para miles de empresas</li>
                    <br>
                    <li>Recibe ofertas adecuadas a tu perfil</li>
                    <br>
                    <li>Sigue el estado de tus postulaciones</li>
                    <br>
                    <li>Compárate con los demás inscritos</li>
                    <br>
                </h4>
                </ul>
            
                </div>    
                <div class="col-sm-4" style="background-color: #d5f5e3 "> 
                    <div > 
                        <h4>Usuario: </h4>
                        <?= $form->field($model, 'usuario') 
                        ->label(false) ?>
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
    </div>
    <?php ActiveForm::end(); ?>
    
</div><!-- registroView -->