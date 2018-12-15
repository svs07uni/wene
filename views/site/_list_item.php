<?php
/* _list_item.php <?= Html::a(Html::encode($model->titulo), Url::toRoute(['post/show', 'id' => $model->id_convocatoria]), ['title' => $model->titulo]) ?>
*/
use yii\helpers\Html;
use yii\helpers\Url;
?>
<div class="col-sm-4">
<?php if($model->activo){
    ?><div class="panel panel-success">
    		<div class="panel-heading"style="border: 1px solid green;"><?php
}else {
     ?><div class="panel panel-danger">
     		<div class="panel-heading"style="border: 1px solid red;"><?php 
}?>
		<h4 class="title">
			<?= Html::encode($model->titulo);?>
		</h4>
	</div>
	<div class="panel-body" style="height: 250px; overflow: hidden;">
		<div class="item-excerpt">
			<?=Html::encode(substr($model->descripcion,0,400));?>...
			</br>
			<?= Html::a('Ver Mas', ['convocatoriausuario/vermas','id_convocatoria'=>$model->id_convocatoria]) ?>
		</div>
	</div>
	<div class="panel-footer clearfix">
		<?php 
		$fecha = 'Fecha limite: '. substr($model->fecha_hasta,0,10);
		$activo = 'label-'.($model->activo?'success':'danger');
		?>
		<?= Html::label($fecha,null,['class' =>$activo])?>
		<?= Html::a('Postular', ['convocatoriausuario/postularse','id_convocatoria'=>$model->id_convocatoria], ['class' => 'btn btn-success pull-right']) ?>
	</div>
</div>
</div>