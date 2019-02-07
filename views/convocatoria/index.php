<?php

use yii\helpers\Html;
use yii\grid\GridView;


/* @var $this yii\web\View */
/* @var $searchModel app\models\ConvocatoriaSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Convocatorias';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="convocatoria-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Crear Convocatoria', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
    		'layout' => '{items}',
        'filterModel' => $searchModel,
        'columns' => [
            //['class' => 'yii\grid\SerialColumn'],

        	'tipo.nombre',
            'titulo',
            ['attribute'=>'fecha_alta',
        		'format'=>['DateTime','php:d-m-Y']],
        	'cant_postulantes',
            

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
