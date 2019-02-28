<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\grid\GridView;

use dosamigos\datepicker\DatePicker;
use dosamigos\datepicker\DateRangePicker;






/* @var $this yii\web\View */
/* @var $model app\models\Convocatoria */
/* @var $form yii\widgets\ActiveForm */
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
			<?php if (is_null($postulante)): ?>
				<?= /*si no esta postulado*/
				 Html::a('Postular', ['convocatoriausuario/postularse','id_convocatoria'=>$model->id_convocatoria], ['class' => 'btn btn-success pull-right'])?>
			<?php else: ?>
			<?= /*si  esta postulado*/
				 Html::a('Despostular', ['convocatoriausuario/despostularse','id_convocatoria'=>$model->id_convocatoria], ['class' => 'btn btn-warning pull-right'])?>
			<?php endif; ?>
			<?= Html::a('Convocatoria', ['/',], ['class' => 'btn btn-success pull-left'])?>
				<?= Html::encode($model->institucion->nombre);?>
				<br>
				<small>Institucion</small>
			</h2>
			<hr>
		</div>
		<div class="container-fluid">
			<h4>
				<dt>Carreras Requeridas</dt>
			</h4>
				<?= GridView::widget([
					'dataProvider' => $dataProviderCarrerasDest,
					'layout' => '{items}',
					'columns' => [            
						['label' => 'Nombre',
							'attribute' => 'carrera.nombre'],
						['label' => 'Años necesarios',
							'attribute' => 'anios_necesario'],
						['label' => 'Cant. materias necesarias',
							'attribute' => 'cant_materias_nec'],
					],
				]); ?>
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