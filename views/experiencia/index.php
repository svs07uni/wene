<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ExperienciaSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Experiencias';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="experiencia-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            //'id_experiencia',
            //'id_usuario',
            'titulo',
            'descripcion',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

    <p>
        <?= Html::a('Agregar Experiencia Laboral', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
</div>
