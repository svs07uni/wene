<?php

namespace app\controllers;

use Yii;
use app\models\Experiencia;
use app\models\ExperienciaSearch;
use app\models\Aptitud;
use app\models\AptitudSearch;
use app\models\Estudio;
use app\models\EstudioSearch;
use app\models\Publicacion;
use app\models\PublicacionSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;


/**
 * ExperienciaController implements the CRUD actions for Experiencia model.
 */
class ExperienciaController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Experiencia models.
     * @return mixed
     */
    public function actionIndex()
    {

        $usuario = Yii::$app->user->identity;

        //EXPERICIENCIA
        $searchModel = new ExperienciaSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams,$usuario->id_registro);
        
        //APTITUD
        $searchModelAptitud = new AptitudSearch();
        $dataProviderAptitud = $searchModelAptitud->search(Yii::$app->request->queryParams,$usuario->id_registro);

        //ESTUDIO
        $searchModelEstudio = new EstudioSearch();
        $dataProviderEstudio = $searchModelEstudio->search(Yii::$app->request->queryParams,$usuario->id_registro);

        //PUBLICACION
        $searchModelPublicacion = new PublicacionSearch();
        $dataProviderPublicacion = $searchModelPublicacion->search(Yii::$app->request->queryParams,$usuario->id_registro);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'searchModelAptitud' => $searchModelAptitud,
            'dataProviderAptitud' => $dataProviderAptitud,
            'searchModelEstudio' => $searchModelEstudio,
            'dataProviderEstudio' => $dataProviderEstudio,
            'searchModelPublicacion' => $searchModelPublicacion,
            'dataProviderPublicacion' => $dataProviderPublicacion,
        ]);
    }

    /**
     * Displays a single Experiencia model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Experiencia model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Experiencia();
        $usuario = Yii::$app->user->identity;
        $model->id_usuario = $usuario->id_registro;
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['index']);
        }

        return $this->render('create', [
            'model' => $model
        ]);
    }

    /**
     * Creates a new Aptitud model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreateaptitud()
    {
        $model = new Aptitud();
        $usuario = Yii::$app->user->identity;
        $model->id_usuario = $usuario->id_registro;
        
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['index']);
        }

        return $this->render('createaptitud', [
            'model' => $model,
        ]);
    }

    /**
     * Creates a new Estudio model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreateestudio()
    {
        $model = new Estudio();
        $usuario = Yii::$app->user->identity;
        $model->id_usuario = $usuario->id_registro;
        
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['index']);
        }

        return $this->render('createestudio', [
            'model' => $model,
        ]);
    }

    /**
     * Creates a new Publicacion model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreatepublicacion()
    {
        $model = new Publicacion();
        $usuario = Yii::$app->user->identity;
        $model->id_usuario = $usuario->id_registro;
        
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['index']);
        }

        return $this->render('createpublicacion', [
            'model' => $model,
        ]);
    }


    /**
     * Updates an existing Experiencia model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id_experiencia]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Experiencia model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Experiencia model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Experiencia the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Experiencia::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }


    


}
