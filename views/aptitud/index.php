<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\AptitudSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Aptitud';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="aptitud-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Crear Aptitud', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
    	'layout' => '{items}',
        'filterModel' => $searchModel,
        'columns' => [
           // ['class' => 'yii\grid\SerialColumn'],

            //'id_aptitud',
            'tipo',
            //'nivel',
        	'usuario.nombre',
        	'usuario.apellido',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
