<?php

use yii\web\Controller;

namespace app\controllers;


class RegistroUsuarioController extends \yii\web\Controller
{
    public function actionIndex()
    {
        return $this->render('index');
    }


    public function actionRegistroUsuario()
    {   

    $model = new \app\models\Usuario();
    echo("asd");
    print_r($model);
    if ($model->load(Yii::$app->request->post())) {
        if ($model->validate()) {
            // form inputs are valid, do something here
            return;
        }
    }

    return $this->render('registroUsuario', [
        'model' => $model,
    ]);
}
}
