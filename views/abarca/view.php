<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Abarca */

$this->title = $model->id_abarca;
$this->params['breadcrumbs'][] = ['label' => 'Abarcas', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="abarca-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id_abarca], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id_abarca], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id_abarca',
            'id_dependencia',
            'id_usuario',
        ],
    ]) ?>

</div>
