<?php

namespace app\controllers;
use Yii;
use app\models\Convocatoria;
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
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $usuario = Yii::$app->user->identity;
        

        return $this->render('misConvocatorias', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function postularse(){

    }


}
