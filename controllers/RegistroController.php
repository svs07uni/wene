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
        $model = new \app\models\Registro();    
        if ($model->load(\Yii::$app->request->post())&& $model->save()) {
            if ($model->validate()) {
                //$this->actionGuardado();
                return $this->redirect(['view']);
                //return;
            }
        }
        return $this->render('registroView', [
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
