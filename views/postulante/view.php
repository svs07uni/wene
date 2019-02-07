<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Postulante */

$this->title = $model->id_postulante;
$this->params['breadcrumbs'][] = ['label' => 'Postulantes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="postulante-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Actualizar', ['update', 'id' => $model->id_postulante], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Borrar', ['delete', 'id' => $model->id_postulante], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Esta seguro/a que desea borrar este postulante ?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id_postulante',
            'id_usuario',
            'usuario.nombre',
        	'usuario.apellido',
            'convocatoria.titulo',
        	'convocatoria.institucion.nombre',	
        	['attribute'=>'fecha_postulado',
        		'format'=>['DateTime','php:d-m-Y']],
            'id_estado',
            'orden_merito',
        ],
    ]) ?>

</div>
