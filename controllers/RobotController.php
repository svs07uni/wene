<?php
namespace app\controllers;

use Yii;
use yii\web\Controller;
use app\models\Rendimiento_no_acad;

class RobotController extends \yii\web\Controller
{
    public function actionIndex()
    {
    	
        $output = file_get_contents('http://mocovi.uncoma.edu.ar/designa/1.0/aplicacion.php?ah=st5bf6aa9e1c0f07.38686516&ai=designa||3810');

        $datos = json_decode($output);
        //INICIAR TRANSACCION
        Rendimiento_no_acad::deleteAll();
        Rendimiento_no_acad::reponerBD($datos);
        //return $this->render('index');
    }
}
?>