<?php

namespace app\controllers;
use Yii;
use app\models\Convocatoria;
use app\models\Postulante;
use app\models\ConvocatoriaSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use app\models\Tipo;
use yii\grid\GridView;

class ConvocatoriausuarioController extends \yii\web\Controller
{
    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionMisconvocatorias(){
        $searchModel = new ConvocatoriaSearch();
        $usuario = Yii::$app->user->identity;
        $dataProvider = $searchModel->search_postulante(Yii::$app->request->queryParams,$usuario->id_registro);
        $modelConvocatoria = new Convocatoria;
        //print_r($usuario->id_registro);

        return $this->render('misConvocatorias', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'modelConvocatoria' => $modelConvocatoria,
        ]);
    }

    public function actionPostularse($id_convocatoria){
        $usuario = Yii::$app->user->identity;
        $model = new Postulante();
        $model->id_convocatoria = $id_convocatoria;
        $model->id_usuario=$usuario->id_registro;
        $model->id_estado=1;//poner constante en estado postulante, cuando est
        $model->orden_merito=0;                
        $model->fecha_postulado=date("Y-m-d");

      	if($model->save()){
      		return $this->redirect(['misconvocatorias']);
        } 
        echo("error");
    }
    /*
    public function actionVermas($id_convocatoria) {
        $model = Convocatoria::findOne($id_convocatoria);
        return $this->render('convocatoria1', [
            'model' => $model,
        ]);
    }*/

    /*
    *   View de la grilla para ver una convocatoria
    */
    public function actionConvocatoriaview($id){
        $model = new Convocatoria();

        return $this->render('//convocatoria/viewUsuario',[
            'model' => $model::findOne($id),   
            //'id' => $id
        ]);
    }

}