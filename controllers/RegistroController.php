<?php
use yii\web\Controller;

namespace app\controllers;

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
                return $this->goHome();
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
	public function antesDeGuardar()
	{
        $pass = md5($this->password);
        $this->password = $pass;
        return true;
	}
}
