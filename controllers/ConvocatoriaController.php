<?php

namespace app\controllers;

use Yii;
use app\models\Convocatoria;
use app\models\ConvocatoriaSearch;
use app\models\Postulante;
use app\models\PostulanteSearch;
use app\models\Carrera;
use app\models\CarreraDestinada;
use yii\web\Controller;
use yii\data\ActiveDataProvider;
use yii\web\NotFoundHttpException;
use yii\helpers\ArrayHelper;
use yii\filters\VerbFilter;
use app\models\Tipo;
use yii\grid\GridView;
use phpDocumentor\Reflection\Types\This;

/**
 * ConvocatoriaController implements the CRUD actions for Convocatoria model.
 */
class ConvocatoriaController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'ruleConfig' => [
                    'class' => AccessRule::className(),
                ],
                'only' => ['index','view','delete','create','update'],
                'rules' => [
                    [
                        'actions' => ['index','view','delete','create','update'],
                        'allow' => true,
                        'roles' => [User::ROLE_GESTOR],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Lists all Convocatoria models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new ConvocatoriaSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Convocatoria model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
    	$searchModel = new PostulanteSearch();
    	$searchModel->id_convocatoria=$id;
    	$dataProvider = $searchModel->search(null);

        return $this->render('view', [
            'model' => $this->findModel($id),
        		'searchModel' => $searchModel,
        		'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Creates a new Convocatoria model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Convocatoria();
        $usuario = Yii::$app->user->identity;
        $id_usuario = $usuario->id_registro;
        // Filtra en base a las dependencias que abarca el gestor
        $colCarreras = Carrera::find()
                                ->all();
        $carreras = ArrayHelper::map($colCarreras, 
                                        'id_carrera', 
                                        'nombre');       

        $query = CarreraDestinada::find()->joinWith('carrera');
                                
        $dataProviderCarrerasDest = new ActiveDataProvider([
            'query' => $query,]);                             

      if ($model->load(Yii::$app->request->post())) {
      	$model->fecha_alta=date("d/m/Y");
        $model->activo = true;
        
      	if($model->save()){
      		return $this->redirect(['update', 'id' => $model->id_convocatoria]);
      		} 
      	           
        }
        
        return $this->render('create', [
            'model' => $model,
            'carreras' => $carreras,
            'dataProviderCarrerasDest' => $dataProviderCarrerasDest
        ]);
    }
    
    
    public function actionUpdatepostulante($id_convocatoria, $id_postulante){
    	
    	{
    		$model = Postulante::findOne($id_postulante);
    		
    		if ($model->load(Yii::$app->request->post()) && $model->save()) {
    			return $this->redirect(['view', 'id' => $model->id_postulante]);
    		}
    		
    		return $this->render('updatepostulante', [
    				'model' => $model,
    		]);
    	}
    	   	
    }
         
   /**
     * Updates an existing Convocatoria model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    
    
    
    public function actionUpdate($id)
    {//print_r($aux);exit;
        $quitarCarrera = Yii::$app->request->getQueryParam('d');
        if(isset($quitarCarrera)){
            $abarca = CarreraDestinada::find()
                        ->where(['id_carrera'=>$quitarCarrera, 'id_convocatoria'=>$id])
                        ->one();
            $abarca->delete();  

            $this->redirect('@web/convocatoria/update/'.$id);          
        }

        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            $idCarrera = Yii::$app->request->post()['Convocatoria']['unaCarreraDest'];

            if($idCarrera > 0){
                $modelCarrera = Carrera::findOne($idCarrera);

                $destinada = CarreraDestinada::find()
                        ->where(['id_carrera'=>$idCarrera, 'id_convocatoria'=>$id])
                        ->one();
                if(!isset($destinada)){
                    $destinada = new CarreraDestinada();
                    $destinada->id_convocatoria = $id;
                    $destinada->id_carrera = $idCarrera;
                    $destinada->anios_necesario = Yii::$app->request->post()['Convocatoria']['unaCarreraDestAnios'];
                    $destinada->cant_materias_nec = Yii::$app->request->post()['Convocatoria']['unaCarreraDestMaterias'];
                    $destinada->save();
                }
                           
            }else{
                return $this->redirect(['view', 'id' => $model->id_convocatoria]);
            }
        }

        $query = CarreraDestinada::find()->joinWith('carrera')
                ->where(['id_convocatoria' => $id]);
        
        $dataProviderCarrerasDest = new ActiveDataProvider([
            'query' => $query,
        ]);

        $usuario = Yii::$app->user->identity;
        $id_usuario = $usuario->id_registro;
//print_r($query);exit;
        // Filtra en base a las dependencias que abarca el gestor
        $colCarreras = Carrera::find()
                                ->joinWith('dependencia')
                                ->joinWith('dependencia.abarcas')
                                ->where(['id_usuario'=>$id_usuario])
                                ->all();
        $carreras = ArrayHelper::map($colCarreras, 
                                        'id_carrera', 
                                        'nombre');

        return $this->render('update', [
            'model' => $model,
            'carreras' => $carreras,
            'dataProviderCarrerasDest' => $dataProviderCarrerasDest
        ]);
    }

    /**
     * Deletes an existing Convocatoria model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        try{//print_r("expression");exit;
            $this->findModel($id)->delete();
        }catch(\Exception $e){
            $convocatoria = Convocatoria::findOne($id);
            $convocatoria->activo = false;
            $convocatoria->save();
        }
        
        return $this->redirect(['index']);
    }


    /**
     * Finds the Convocatoria model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Convocatoria the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Convocatoria::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
    
   



}
