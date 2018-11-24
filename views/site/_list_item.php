<?php
// _list_item.php
use yii\helpers\Html;
use yii\helpers\Url;
?>
<div class="panel panel-success col-sm-4">
<div class="panel-heading"> 
    <h2 class="title">
    <?= Html::a(Html::encode($model->titulo), Url::toRoute(['post/show', 'id' => $model->id_convocatoria]), ['title' => $model->titulo]) ?>
    </h2>
</div>
<div class="panel-body">
    <div class="item-excerpt">
    <?= Html::encode($model->descripcion); ?>
    </div>
	</div>
    </div>