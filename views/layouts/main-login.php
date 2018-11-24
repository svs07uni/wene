<?php
use backend\assets\AppAsset;
use yii\helpers\Html;

/* @var $this \yii\web\View style="background-image:url('<?=$directoryAsset?>/img/UNCo.jpg')"*/
/* @var $content string */

dmstr\web\AdminLteAsset::register($this);
?>
<?php $directoryAsset = Yii::$app->assetManager->getPublishedUrl('@vendor/almasaeed2010/adminlte/dist'); ?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>    
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
    
</head>
<body class="login-page"  >

<?php $this->beginBody() ?>

    <?= $content ?>

<?php $this->endBody() ?>

</body>
</html>
<?php $this->endPage() ?>
