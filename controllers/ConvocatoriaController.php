<?php

namespace app\controllers;

use Yii;
use app\models\Convocatoria;
use app\models\ConvocatoriaSearch;
use app\models\Postulante;
use app\models\PostulanteSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
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
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
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
                
      if ($model->load(Yii::$app->request->post())) {
      	$model->fecha_alta=date("d/m/Y");
      	if($model->save()){
      		return $this->redirect(['view', 'id' => $model->id_convocatoria]);
      		} 
      	           
        }
        
        
        
      /*  $datos_tipo= array();
        $tipo= Tipo::find()->all();
        foreach ($tipo as $it){
        	$datos_tipo[$it->id_tipo]=$it->nombre;
             	
        }*/
        
        
        
       // print_r($tipo);
        //print_r($datos_tipo);
        
        
	
        return $this->render('create', [
            'model' => $model,
        		//'datos_tipo' => $datos_tipo,
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
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id_convocatoria]);
        }

        return $this->render('update', [
            'model' => $model,
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
        $this->findModel($id)->delete();

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
