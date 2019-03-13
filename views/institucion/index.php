<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\InstitucionSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Institucion';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="institucion-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Crear Institucion', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
    	'layout' => '{items}',
        'filterModel' => $searchModel,
        'columns' => [
           // ['class' => 'yii\grid\SerialColumn'],

            //'id_institucion',
            'nombre',
            'email:email',
            'telefono',
            //'direccion',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
