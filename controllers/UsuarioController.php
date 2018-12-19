<?php
namespace app\controllers;
use Yii;
use yii\web\Controller;
use yii\helpers\Json;
use app\models\Provincia;
use app\models\Usuario;
use app\models\Experiencia;
use app\models\ExperienciaSearch;
use app\models\Aptitud;
use app\models\AptitudSearch;
use app\models\Estudio;
use app\models\EstudioSearch;
use app\models\Publicacion;
use app\models\PublicacionSearch;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

class UsuarioController extends \yii\web\Controller
{
    /**
     * Ver perfil usuario
     */
    public function actionPerfil()
    {
        $id_usuario =\Yii::$app->getRequest()->getQueryParam('id');
        $modelUsr = Usuario::find()
        ->where(['id_registro' => $id_usuario])
        ->one();
        
        //EXPERICIENCIA
        $searchModel = new ExperienciaSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams,$id_usuario);
        
        //APTITUD
        $searchModelAptitud = new AptitudSearch();
        $dataProviderAptitud = $searchModelAptitud->search(Yii::$app->request->queryParams,$id_usuario);

        //ESTUDIO
        $searchModelEstudio = new EstudioSearch();
        $dataProviderEstudio = $searchModelEstudio->search(Yii::$app->request->queryParams,$id_usuario);

        //PUBLICACION
        $searchModelPublicacion = new PublicacionSearch();
        $dataProviderPublicacion = $searchModelPublicacion->search(Yii::$app->request->queryParams,$id_usuario);

        return $this->render('perfil', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'searchModelAptitud' => $searchModelAptitud,
            'dataProviderAptitud' => $dataProviderAptitud,
            'searchModelEstudio' => $searchModelEstudio,
            'dataProviderEstudio' => $dataProviderEstudio,
            'searchModelPublicacion' => $searchModelPublicacion,
            'dataProviderPublicacion' => $dataProviderPublicacion,
            'modelUsr'=>$modelUsr,
        ]);
    }

    /**
     * Registro de un nuevo usuario
     */
    public function actionRegistro()
    {
        $model = new \app\models\Usuario();
        //agrega el id_registro del usuario logueado actual
        $registro = \Yii::$app->getRequest()->getQueryParam('r');
        $model->id_registro = $registro;
        
        //agrega el id_rol de estudiante para todos, por ahora hardcode
        $model->id_rol = 2;
        //$roles = \yii\helpers\ArrayHelper::map(\app\models\Rol::find()->where(${['nombre'=>'Postulante']})->one());
        $guardar= false;
        if ($model->load(\Yii::$app->request->post())) {
            $usuario= \Yii::$app->user->identity;
            //$model->id_registro= $usuario->id_registro;//id_registro del usuario actual
             if ($model->save()) {
                 // form inputs are valid, do something here
                echo($guardar);
                
                echo \yii2mod\alert\Alert::widget([
                    'options' => [
                        'title' => "Datos actualizados correctamente!",
                        'text' => "Ahora puedes acceder a todas las ofertas laborales.",
                        
                    ],
                'callback' => new \yii\web\JsExpression(' function() { 
                    $guardar = true
                }')
                 ]);
                 echo($guardar);
                if ($guardar = true){
                    //Yii::$app->response->redirect(['/site/login']);
                }
                //Yii::$app->response->redirect(['/site/login']);
                
             }
        }

        return $this->render('usuario', [
            'model' => $model,
        ]);
    }


    
    /**
     * Edicion de los datos del usuario
     */
    public function actionEditar()
    {
        $model = new \app\models\Usuario();

        if ($model->load(\Yii::$app->request->post())) {
            if ($model->save()) {
                
            }
        }

        return $this->render('actualizar', [
            'model' => $model,
        ]);
    }

    /**
     * Obtener las localidades de una provincia, utilizado en dropdown dependientes
     */
    public function actionLocalidades()
    {
    $out = [];
    if (isset($_POST['depdrop_parents'])) {
        $parents = $_POST['depdrop_parents'];
        if ($parents != null) {
            $id_provincia = $parents[0];
            $provincia= Provincia::findOne($id_provincia);
            $out = $provincia->obtenerLocalidadesArray();
            echo Json::encode(['output'=>$out, 'selected'=>'']);
            return;
        }
    }

    echo Json::encode(['output'=>'', 'selected'=>'']);
    }

}
