<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Aptitud */

$this->title = 'Nueva Publicacion';
$this->params['breadcrumbs'][] = ['label' => 'Experiencias', 'url' => ['index']];
//$this->params['breadcrumbs'][] = $this->title;
?>
<div class="experiencia-create">
    
    <?= $this->render('_formpublicacion', [
        'model' => $model,
    ]) ?>

</div>
