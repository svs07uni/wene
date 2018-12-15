<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Usuario */

$this->title = $model->rol->nombre.' n°'.$model->id_registro;
$this->params['breadcrumbs'][] = ['label' => 'Usuarios', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
        
?>
<div class="usuario-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Editar', ['update', 'id' => $model->id_registro], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Eliminar', ['delete', 'id' => $model->id_registro], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Seguro que desea eliminar este gestor?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            //'id_registro',
            'dni',
            'apellido',
            'nombre', 
            [
                'attribute' => 'fecha_nac',
                'format'    => ['datetime', 'php:m/d/Y'],
            ],           
            'telefono',  
            'direccion',
            [                      // the owner name of the model
                'label' => 'Localidad',
                'value' => $model->localidad->nombre,
            ],
            [                      // the owner name of the model
                'label' => 'Provincia',
                'value' => $model->localidad->provincia->nombre,
            ],            
            //'foto',
            //'nombre_foto',            
            'nacionalidad',
            'activo:boolean',
        ],
    ]) ?>

</div>
