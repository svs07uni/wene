<?php

namespace app\controllers;

use Yii;
use app\models\Usuario;
use app\models\Abarca;
use app\models\UsuariosSearch;
use app\models\Dependencia;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\data\ActiveDataProvider;
use yii\helpers\ArrayHelper;
use app\models\User;
use app\common\components\AccessRule;
use yii\filters\AccessControl;

/**
 * UsuariosController implements the CRUD actions for Usuario model.
 */
class UsuariosController extends Controller
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
                        'roles' => [User::ROLE_ADMIN],
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
     * Lists all Usuario models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new UsuariosSearch();
        //$searchModel->id_rol = 3;
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Usuario model.
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
     * Creates a new Usuario model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Usuario();
        $model->id_rol = 3;

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id_registro]);
        }

        $colProvincias = Provincia::find()->all();
        $provincias = ArrayHelper::map($colProvincias, 
                                        'id_provincia', 
                                        'nombre');
        
        return $this->render('create', [
            'model' => $model,
            'provincias' => $provincias
        ]);
    }

    /**
     * Updates an existing Usuario model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $quitarDep = Yii::$app->request->getQueryParam('d');
        if(isset($quitarDep)){
            $abarca = Abarca::find()
                        ->where(['id_dependencia'=>$quitarDep, 'id_usuario'=>$id])
                        ->one();
            $abarca->delete();            
        }

        $model = $this->findModel($id);

        //Usado para agregar dependencias para gestionar
        if(Yii::$app->request->post()){
            $idDep = Yii::$app->request->post()['Dependencia']['id_dependencia'];
            if($idDep > 0){
                $modelDep = Dependencia::findOne($idDep);

                $abarca = Abarca::find()
                        ->where(['id_dependencia'=>$idDep, 'id_usuario'=>$id])
                        ->one();
                if(!isset($abarca)){
                    $abarca = new Abarca();
                    $abarca->id_usuario = $id;
                    $abarca->id_dependencia = $idDep;
                    $abarca->save();
                }
            }
        }
         
        $modelDep = new Dependencia();
        
        $colDependencias = Dependencia::find()->all();
        $dependencias = ArrayHelper::map($colDependencias, 
                                        'id_dependencia', 
                                        'nombre');
        
        $query = Dependencia::find()
                    ->joinWith('abarcas')
                    ->andFilterWhere(['abarca.id_usuario' => $id]);
        $dataProviderAbarca = new ActiveDataProvider([
            'query' => $query,
        ]);

        return $this->render('update', [
            'model' => $model,
            'modelDep' => $modelDep,            
            'dependencias' => $dependencias,
            'dataProviderAbarca' => $dataProviderAbarca
        ]);
    }

    /**
     * Deletes an existing Usuario model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        //$this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Usuario model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Usuario the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Usuario::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
