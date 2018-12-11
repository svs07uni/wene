<?php
namespace app\controllers;

use yii\web\Controller;
class RegistroController extends \yii\web\Controller
{
    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionRegistro()
    {
        
        $model = new \app\models\Registro();    //carga del modelo para utilizarlo luego
        if ($model->load(\Yii::$app->request->post())){// si se realizo un submit del boton guardar
            $model->fecha_registro =  date("d/m/Y");//se carga la fecha de registro
            
            if ($model->save()) {//guardado de los datos 
                //mensaje de exito
                echo \yii2mod\alert\Alert::widget([
                    'options' => [
                        'title' => "Registro Existoso!",
                        'text' => "Te enviaremos un email para verificar tu cuenta",
                    ]
                    
                ]);
                return $this->redirect('@web/usuario/registro?r='.$model->id_registro);
                
                //if ($model->validate()) {
                    //print_r(date("Y-m-d"));
                    
                    //return;
                //}
            }    
        }
        return $this->render('registroView', [// en caso de que no se quiera guardar y solo se accede por primera vez
            'model' => $model,
        ]);
    }

    
    
    /**Posible guardado con md5 */
	public function beforeSave()
	{
        $pass = md5($this->password);
        $this->password = $pass;
        return true;
    }





}

