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
        $model = new Experiencia();
        $searchModel = new ExperienciaSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams,$usuario->id_registro);
        
        //APTITUD
        $modelAptitud = new Aptitud();
        $searchModelAptitud = new AptitudSearch();
        $dataProviderAptitud = $searchModelAptitud->search(Yii::$app->request->queryParams,$usuario->id_registro);

        //ESTUDIO
        $modelEstudio = new Estudio();
        $searchModelEstudio = new EstudioSearch();
        $dataProviderEstudio = $searchModelEstudio->search(Yii::$app->request->queryParams,$usuario->id_registro);

        //PUBLICACION
        $modelPublicacion = new Publicacion();
        $searchModelPublicacion = new PublicacionSearch();
        $dataProviderPublicacion = $searchModelPublicacion->search(Yii::$app->request->queryParams,$usuario->id_registro);

        return $this->render('index', [
            'usuario'   => $usuario,
            'modelExpericiencia'     => $model,
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'modelAptitud'  => $modelAptitud,
            'searchModelAptitud' => $searchModelAptitud,
            'dataProviderAptitud' => $dataProviderAptitud,
            'modelEstudio'  => $modelEstudio,
            'searchModelEstudio' => $searchModelEstudio,
            'dataProviderEstudio' => $dataProviderEstudio,
            'modelPublicacion'  => $modelPublicacion,
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

/** OPERACIONES DE APTITUD */
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
    /*
    *   View de la grilla para ver una aptitud
    */
    public function actionAptitudview($id){
        $model = new Aptitud();

        return $this->render('//aptitud/view', [
            'model' => $model::findOne($id),   
            'id' => $id
        ]);
    }
    /*
    *   View de la grilla para editar una aptitud
    */
    public function actionAptitudupdate($id){
        $modelAux = new Aptitud();
        $model = $modelAux::findOne($id);
        //guardado luego de realizar la edición
        if ($model->load(Yii::$app->request->post())  ) {
            if($model->save()){
                return $this->redirect(['index', 'id' => $model->id_aptitud]);
            }
        }
        //llamada al controller de aptitud para hacer update
        return $this->render('//aptitud/update', [
            'model' => $model::findOne($id),   
            'id' => $id
        ]);
    }
    /*
    *   View de la grilla para eliminar una aptitud
    */
    public function actionAptituddelete($id){
        $modelAux = new Aptitud();
        $model = $modelAux::findOne($id);
        //print_r($model);
        //exit();
        $this->$model->delete();

        return $this->redirect(['index']);
    }

/** OPERACIONES DE ESTUDIO */
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
    /*
    *   View de la grilla para ver un estudio
    */
    public function actionEstudioview($id){
        $model = new Estudio();

        return $this->render('//estudio/view', [
            'model' => $model::findOne($id),   
            'id' => $id
        ]);
    }
    /*
    *   View de la grilla para editar un estudio
    */
    public function actionEstudioupdate($id){
        $modelAux = new Estudio();
        $model = $modelAux::findOne($id);
        //guardado luego de realizar la edición
        if ($model->load(Yii::$app->request->post())  ) {
            
            if($model->save()){
                return $this->redirect(['index', 'id' => $model->id_estudio]);
            }
        }
        //llamada al controller de aptitud para hacer update
        return $this->render('//estudio/update', [
            'model' => $model::findOne($id),   
            'id' => $id
        ]);
    }
    /*
    *   View de la grilla para eliminar un estudio
    */
    public function actionEstudiodelete($id){
        $modelAux = new Estudio();
        $model = $modelAux::findOne($id);

        $this->$model->delete();

        return $this->redirect(['index']);
    }

/** OPERACIONES DE PUBLICACIONES */
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
    /*
    *   View de la grilla para ver una publicacion
    */
    public function actionPublicacionview($id){
        $model = new Publicacion();

        return $this->render('//publicacion/view', [
            'model' => $model::findOne($id),   
            'id' => $id
        ]);
    }
    /*
    *   View de la grilla para editar una publicacion
    */
    public function actionPublicacionupdate($id){
        $modelAux = new Publicacion();
        $model = $modelAux::findOne($id);
        //guardado luego de realizar la edición
        if ($model->load(Yii::$app->request->post())  ) {
            if($model->save()){
                return $this->redirect(['index', 'id' => $model->id_publicacion]);
            }
        }
        //llamada al controller de aptitud para hacer update
        return $this->render('//publicacion/update', [
            'model' => $model::findOne($id),   
            'id' => $id
        ]);
    }
    /*
    *   View de la grilla para eliminar una publicacion
    */
    public function actionPublicaciondelete($id){
        $modelAux = new Publicacion();
        $model = $modelAux::findOne($id);

        $this->$model->delete();

        return $this->redirect(['index']);
    }

}
