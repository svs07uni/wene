<?php
/* _list_item.php <?= Html::a(Html::encode($model->titulo), Url::toRoute(['post/show', 'id' => $model->id_convocatoria]), ['title' => $model->titulo]) ?>
*/
use yii\helpers\Html;
use yii\helpers\Url;
use app\models\Postulante;
use yii\widgets\ActiveForm;
use yii\grid\GridView;

use app\models\CarreraDestinada;
use yii\data\ActiveDataProvider;
$query = CarreraDestinada::find()->joinWith('carrera')
                ->where(['id_convocatoria' => $model->id_convocatoria]);
        
 $dataProviderCarrerasDest = new ActiveDataProvider([
       'query' => $query,
]);
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
			<?= GridView::widget([
					'dataProvider' => $dataProviderCarrerasDest,
					'layout' => '{items}',
					'tableOptions' => ['class' => 'table  table-bordered table-hover'],
					'options' => ['style' => 'font-size:10px;'],
					'columns' => [            
						['label' => '',
							'attribute' => 'carrera.nombre'],
					],
				]); ?>
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
		
		$cadena = substr($model->fecha_hasta,0,10);
		$formato = Yii::$app->formatter->asDate($cadena, 'php:d/m/Y');
		$fecha = 'Fecha limite: '.$formato;
		$activo = 'label-'.($model->activo?'success':'danger');
		//para despostular o postular
        $usuario = Yii::$app->user->identity;
        if (!is_null($usuario)){
            $postulante = app\models\Postulante::find()
            ->where(['id_usuario' => $usuario->id_registro,'id_convocatoria' => $model->id_convocatoria])
            ->one();
        }else{
            $postulante = null;
        }

		?>
		<?= Html::label($fecha,null,['class' =>$activo])?>
		
		<?php if (is_null($postulante)): ?>
				<?= /*si no esta postulado*/
				 Html::a('Postular', ['convocatoriausuario/postularse','id_convocatoria'=>$model->id_convocatoria], ['class' => 'btn btn-success pull-right'])?>
			<?php else: ?>
			<?= /*si  esta postulado*/
				Html::a('Despostular', ['convocatoriausuario/despostularse','id_convocatoria'=>$model->id_convocatoria], ['class' => 'btn btn-warning pull-right'])?>
			<?php endif; ?>
	</div>
</div>
</div>