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





}

