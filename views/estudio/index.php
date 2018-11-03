<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\EstudioSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Estudios';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="estudio-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Estudio', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id_estudio',
            'id_institucion',
            'fecha_egreso',
            'id_tipo',
            'titulo',
            //'id_usuario',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
