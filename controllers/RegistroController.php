<?php
use Yii;
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
        echo "asd";
        if ($model->load(\Yii::$app->request->post())) {
            if ($model->validate()) {
                $this->actionGuardado();
                return;
            }
        }
    
        return $this->render('registroView', [
            'model' => $model,
        ]);
    }

    public function actionGuardado(){
        
    }
}
