<?php
namespace app\controllers;

use yii\web\Controller;
use Yii;
use app\models\Registro;
use yii\helpers\Url;
class RegistroController extends \yii\web\Controller
{
    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionRegistro()
    {
        
        $model = new \app\models\Registro();    //carga del modelo para utilizarlo luego
        //$modelAux = new \app\models\Registro();    //carga del modelo para utilizarlo luego
        
        if ($model->load(\Yii::$app->request->post())){// si se realizo un submit del boton guardar
            
            $model->fecha_registro =  date("d/m/Y");//se carga la fecha de registro
            $claveOrig = $model->clave;
            $model->clave = \Yii::$app->getSecurity()->generatePasswordHash($model->clave);
            $usuarios = \yii\helpers\ArrayHelper::map(\app\models\Registro::find()->all(), 'id_registro', 'usuario');
            
            if(! \Yii::$app->getSecurity()->validatePassword($model->claveRepetida,$model->clave)) 
            {
                //Clave es distinta de Clave Repetida
                echo \yii2mod\alert\Alert::widget([
                    'options' => [
                        'title' => "Las claves no coinciden!",
                        'type'=> 'error',
                        'animation' => "slide-from-bottom",

                    ]
                ]);
                $model->clave = $claveOrig; // para que no se vea todo como un hash
            }elseif(in_array($model->usuario,$usuarios)){
                //Ya existe el usuario
                echo \yii2mod\alert\Alert::widget([
                    'options' => [
                        'title' => "El usuario ya existe!",
                        'type'=> 'error',
                        'animation' => "slide-from-top",
                    ]
                ]);
                $model->clave = $claveOrig;
            }
            else{
                 if ($model->save()) {//guardado de los datos 
                    return $this->redirect('@web/usuario/registro?r='.$model->id_registro);
                }
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

    public function actionRecuperar(){
        $modelRegistro = new \app\models\Registro();
        $model = new \app\models\Registro();    //carga del modelo para utilizarlo luego
        $model->email = '';
        if ($model->load(\Yii::$app->request->post())){// si se realizo un submit del boton guardar
            //print_r($model->email);
            if(!$model->email==''){
                $email=''.$model->email;
                $modelRegistro = Registro::find()
                ->where(['email' => $email])
                ->one();

                $nuevaClave= $modelRegistro->usuario."0".rand(0,500);
                $modelRegistro->clave = \Yii::$app->getSecurity()->generatePasswordHash($nuevaClave);
                if($modelRegistro->save(false)){
                    if(!is_null($modelRegistro)){
                        $modelRegistro->enviarMail("Recuperar Contraseña WENE","La contraseña actual es: ".$nuevaClave.". Luego de ingresar podras cambiarla desde el panel de Usuario");
                        echo \yii2mod\alert\Alert::widget([
                            'options' => [
                                'title' => "Exito!",
                                'text' => "Se ha enviado un mail a tu casilla de correo.",
                                
                            ],
                            'callback' => new \yii\web\JsExpression(' function() { 
                                $guardar = true;
                                window.location = "'.Url::to(['/']).'";
                            }')
                         ]);
                    }else{
                    }
                }
            }
        }
        return $this->render('recuperar',['model'=>$model]);

    }
    
    public function actionCambiar(){
        $usuario = Yii::$app->user->identity;
        $model = new \app\models\Registro();    //carga del modelo para utilizarlo luego
        $model = Registro::find()
                ->where(['id_registro' => $usuario->id_registro])
                ->one();

        if ($model->load(\Yii::$app->request->post())){// si se realizo un submit del boton guardar
            //print_r($model);
            $model->clave = \Yii::$app->getSecurity()->generatePasswordHash($model->clave);
            if ($model->save(false)) {//guardado de los datos 
                echo \yii2mod\alert\Alert::widget([
                    'options' => [
                        'title' => "Contraseña actualizada correctamente!",
                        'text' => "Ahora puedes acceder a todas las ofertas laborales.",
                        
                    ],
                    'callback' => new \yii\web\JsExpression(' function() { 
                        $guardar = true;
                        window.location = "'.Url::to(['/']).'";
                    }')
                 ]);
            }
        }
        
        return $this->render('cambiar',['model'=>$model]);

    }

}

