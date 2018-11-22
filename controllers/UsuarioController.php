<?php

use yii\web\Controller;
namespace app\controllers;

class UsuarioController extends \yii\web\Controller
{
    public function actionRegistro()
    {
        //return $this->render('index');
        $model = new \app\models\Usuario();
        //agrega el id_registro del usuario logueado actual
        $registro = \Yii::$app->getRequest()->getQueryParam('r');
        $model->id_registro = $registro;
        //agrega el id_rol de estudiante para todos, por ahora hardcode
        $model->id_rol = 2;
        //$roles = \yii\helpers\ArrayHelper::map(\app\models\Rol::find()->where(${['nombre'=>'Postulante']})->one());
        
        if ($model->load(\Yii::$app->request->post())) {
             //print_r($model);
            $usuario= \Yii::$app->user->identity;
            //$model->id_registro= $usuario->id_registro;//id_registro del usuario actual
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
