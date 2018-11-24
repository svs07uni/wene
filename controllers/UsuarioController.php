<?php
namespace app\controllers;
use Yii;
use yii\web\Controller;
use yii\helpers\Json;
use app\models\Provincia;


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

    public function actionEditar()
    {
        $model = new \app\models\Usuario();

        

        return $this->render('actualizar', [
            'model' => $model,
        ]);
    }

    public function actionLocalidades()
    {
    $out = [];
    if (isset($_POST['depdrop_parents'])) {
        $parents = $_POST['depdrop_parents'];
        if ($parents != null) {
            $id_provincia = $parents[0];
            $provincia= Provincia::findOne($id_provincia);
            $out = $provincia->obtenerLocalidadesArray();
            //print_r($out);
            //exit; //sin param
            // the getSubCatList function will query the database based on the
            // cat_id and return an array like below:
            // [
            //    ['id'=>'<sub-cat-id-1>', 'name'=>'<sub-cat-name1>'],
            //    ['id'=>'<sub-cat_id_2>', 'name'=>'<sub-cat-name2>']
            // ]
            echo Json::encode(['output'=>$out, 'selected'=>'']);
            return;
        }
    }

    echo Json::encode(['output'=>'', 'selected'=>'']);
    }

}
