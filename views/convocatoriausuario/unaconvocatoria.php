<?php
//print_r($model);
use yii\helpers\Html;
?>
<div class="panel panel-success">
	<div class="panel-heading text-center">
		<h4 class="title">
			<?= Html::encode($model->titulo);?>
		</h4>
	</div>
	<div class="panel-body">
		<div class="container-fluid">
			<h2 class="text-center">
			<?= Html::a('Postular', ['convocatoriausuario/postularse','id_convocatoria'=>$model->id_convocatoria], ['class' => 'btn btn-success pull-right'])?>
			<?= Html::a('Convocatoria', ['/',], ['class' => 'btn btn-success pull-left'])?>
				<?= Html::encode($model->institucion->nombre);?>
				<br>
				<small>Institucion</small>
			</h2>
			<hr>
		</div>
		<div class="container-fluid">
			<h4>
				<dt>Descripcion</dt>
			</h4>
				<?= Html::encode($model->descripcion);?>
		</div>		
		<div class="container-fluid">
			<hr>
			<div class="col-sm-4"> 
				<h4>
					<dt>Requisitos</dt>
				</h4>
				<?= Html::encode($model->requisitos);?>
				<h4>
					<dt>Cantidad de postulantes</dt>
				</h4>
				<?= Html::encode($model->cant_postulantes);?>
			</div>
			<div class="col-sm-4" style="border-left:1px solid #eee;height:auto"> 
				<h4>
					<dt>Fechas</dt>
				</h4>
				Alta: <?= Html::encode($model->fecha_alta);?>;<br>
				Desde: <?= Html::encode($model->fecha_desde);?>;<br>
				Hasta: <?= Html::encode($model->fecha_hasta);?>;
			</div>
			<div class="col-sm-4" style="border-left:1px solid #eee;height:auto"> 
				<h4>
					<dt>Dirección</dt>
				</h4>
				<?= Html::encode($model->direccion);?>
				<h4>
					<dt>Sede</dt>
				</h4>
			</div>
		</div>
	</div>
</div>