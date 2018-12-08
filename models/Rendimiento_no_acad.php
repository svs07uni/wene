<?php

namespace app\models;

use Yii;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "rendimiento_no_acad".
 *
 * @property int $id_rendimiento
 * @property int $id_usuario
 * @property string $fecha_actualizado
 * @property string $titulo
 * @property string $descripcion
 * @property string $observacion
 * @property int $id_rol
 * @property int $horas_semanales
 * @property string $fecha_inicio
 * @property string $fecha_fin
 * @property string $norma_legal
 * @property int $id_tipo
 *
 * @property Rol $rol
 * @property Tipo $tipo
 * @property Usuario $usuario
 */
class Rendimiento_no_acad extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'rendimiento_no_acad';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_usuario', 'fecha_actualizado', 'titulo', 'norma_legal'], 'required'],
            [['id_usuario', 'id_rol', 'horas_semanales', 'id_tipo'], 'default', 'value' => null],
            [['id_usuario', 'id_rol', 'horas_semanales', 'id_tipo'], 'integer'],
            [['fecha_actualizado', 'fecha_inicio', 'fecha_fin'], 'safe'],
            [['titulo', 'descripcion', 'observacion', 'norma_legal'], 'string'],
            [['id_rol'], 'exist', 'skipOnError' => true, 'targetClass' => Rol::className(), 'targetAttribute' => ['id_rol' => 'id_rol']],
            [['id_tipo'], 'exist', 'skipOnError' => true, 'targetClass' => Tipo::className(), 'targetAttribute' => ['id_tipo' => 'id_tipo']],
            [['id_usuario'], 'exist', 'skipOnError' => true, 'targetClass' => Usuario::className(), 'targetAttribute' => ['id_usuario' => 'id_registro']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_rendimiento' => 'Id Rendimiento',
            'id_usuario' => 'Id Usuario',
            'fecha_actualizado' => 'Fecha Actualizado',
            'titulo' => 'Titulo',
            'descripcion' => 'Descripcion',
            'observacion' => 'Observacion',
            'id_rol' => 'Id Rol',
            'horas_semanales' => 'Horas Semanales',
            'fecha_inicio' => 'Fecha Inicio',
            'fecha_fin' => 'Fecha Fin',
            'norma_legal' => 'Norma Legal',
            'id_tipo' => 'Id Tipo',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRol()
    {
        return $this->hasOne(Rol::className(), ['id_rol' => 'id_rol']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTipo()
    {
        return $this->hasOne(Tipo::className(), ['id_tipo' => 'id_tipo']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUsuario()
    {
        return $this->hasOne(Usuario::className(), ['id_registro' => 'id_usuario']);
    }

    public static function reponerBD(){
        $output = file_get_contents('http://mocovi.uncoma.edu.ar/designa/1.0/aplicacion.php?ah=st5bf6aa9e1c0f07.38686516&ai=designa||3810');

        if(isset($output)){
            $datos = json_decode($output);

            $connection = \Yii::$app->db;
            $transaction = $connection->beginTransaction();
            try {
                //Borrar todos los registros
                Rendimiento_no_acad::deleteAll();

                //Obtener todos los dni de los usuarios ya creados
                $dni_usuarios = Usuario::find()
                                    ->select(['dni','id_registro'])
                                    ->distinct()
                                    ->all();
                //print_r($datos);exit;

                $usuarios = ArrayHelper::toArray($dni_usuarios, [
                    'app\models\Usuario' => [
                        'id'=>'dni',
                        'value'=>'id_registro'
                    ]
                ]);
                $insertar = array();
                foreach ($datos as $key => $un_dato) {
                    $pos = null;
                    
                    $pos = array_search($un_dato->nro_docum, array_column($usuarios, 'id'));//print_r($pos);
                    if($pos !== false){
                        $item['titulo'] = $un_dato->denominacion;
                        $item['id_tipo'] = $un_dato->tipo == 'I'? 5 : 6;
                        $item['norma_legal'] = $un_dato->norma;
                        $item['funcion'] = $un_dato->funcion;
                        $item['horas_semanales'] = $un_dato->carga_horaria;
                        $item['fecha_inicio'] = $un_dato->desde;
                        $item['fecha_fin'] = $un_dato->hasta;
                        $item['id_usuario'] = $usuarios[$pos]['value'];
                        $item['fecha_actualizado'] = date("d/m/Y H:m:s");;

                        $insertar[] = $item;
                    }            
                }
                //print_r($insertar);exit;
                \Yii::$app->db->createCommand()
                            ->batchInsert('rendimiento_no_acad', ['titulo', 'id_tipo','norma_legal','funcion','horas_semanales','fecha_inicio','fecha_fin','id_usuario','fecha_actualizado'], $insertar)
                            ->execute();
                            
                $transaction->commit();
            } catch(Exception $e) {
                $transaction->rollback();
            }  
        }
         
    }
}
