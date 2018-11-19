<?php

use yii\web\Controller;
namespace app\controllers;

class UsuarioController extends \yii\web\Controller
{
    public function actionIndex()
    {
       
    }

    public function actionUsuario()
    {
         //return $this->render('index');
         $model = new \app\models\Usuario();
        
         if ($model->load(\Yii::$app->request->post())) {
             //print_r($model);
             if ($model->save()) {
                 // form inputs are valid, do something here
                 echo \yii2mod\alert\Alert::widget([
                     'options' => [
                         'title' => "Datos actualizados correctamente!",
                         'text' => "Ahora puedes acceder a todas las ofertas laborales.",
                     ]
                     
                 ]);
             }
         }
         
 
         return $this->render('usuario', [
             'model' => $model,
         ]);
    }




}
