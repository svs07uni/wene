<?php
/* _list_item.php <?= Html::a(Html::encode($model->titulo), Url::toRoute(['post/show', 'id' => $model->id_convocatoria]), ['title' => $model->titulo]) ?>
*/
use yii\helpers\Html;
use yii\helpers\Url;
?>
<div class="container-fluid">
    	<div class="panel-group col-sm-6">
        	<div class="panel panel-success">
        		<div class="panel-heading">
        			<h2 class="title">
        				<?= Html::encode($model->titulo); ?>
        			</h2>
        		</div>
        		<div class="panel-body">
        			<div class="item-excerpt">
            			<?= Html::encode($model->descripcion); ?>
            		</div>
        		</div>
        		<div class="panel-footer">Panel Footer</div>
        	</div>
		</div>
	
</div>