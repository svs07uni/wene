<?php
//print_r($model);
use yii\helpers\Html;
?>
<div class="panel panel-success">
	<div class="panel-heading">
		<h4 class="title">
			<?= Html::encode($model->titulo);?>
		</h4>
	</div>
	<div class="panel-body">
		<h4 class="title">
			Descripcion
		</h4>
		<?= Html::encode($model->descripcion);?>
	</div>
</div>