<?php

use yii\web\Controller;
namespace app\controllers;

class UsuarioController extends \yii\web\Controller
{
    public function actionIndex()
    {
        //return $this->render('index');
        $model = new \app\models\Usuario();
        
        if ($model->load(\Yii::$app->request->post())) {
            if ($model->save()) {
                // form inputs are valid, do something here
                return;
            }
        }
        

        return $this->render('usuario', [
            'model' => $model,
        ]);
    }

    public function actionUsuario()
    {
    }




}
