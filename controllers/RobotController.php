<?php
namespace app\controllers;

use Yii;
use yii\web\Controller;
use app\models\Rendimiento_no_acad;

class RobotController extends \yii\web\Controller
{
    public function actionIndex()
    {
        Rendimiento_no_acad::reponerBD();
    }
}
?>