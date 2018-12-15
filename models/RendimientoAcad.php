<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "rendimiento_acad".
 *
 * @property int $id_rendimiento
 * @property int $id_usuario
 * @property string $fecha_actualizado
 * @property int $cant_mat_aprobadas
 * @property int $anio_carrera
 * @property string $legajo
 * @property string $fecha_egreso
 * @property int $id_carrera
 *
 * @property Carrera $carrera
 * @property Usuario $usuario
 */
class RendimientoAcad extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'rendimiento_acad';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_usuario', 'fecha_actualizado', 'id_carrera'], 'required'],
            [['id_usuario', 'cant_mat_aprobadas', 'anio_carrera', 'id_carrera'], 'default', 'value' => null],
            [['id_usuario', 'cant_mat_aprobadas', 'anio_carrera', 'id_carrera'], 'integer'],
            [['fecha_actualizado', 'fecha_egreso'], 'safe'],
            [['legajo'], 'string'],
            [['id_carrera'], 'exist', 'skipOnError' => true, 'targetClass' => Carrera::className(), 'targetAttribute' => ['id_carrera' => 'id_carrera']],
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
            'cant_mat_aprobadas' => 'Cant Mat Aprobadas',
            'anio_carrera' => 'Anio Carrera',
            'legajo' => 'Legajo',
            'fecha_egreso' => 'Fecha Egreso',
            'id_carrera' => 'Id Carrera',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCarrera()
    {
        return $this->hasOne(Carrera::className(), ['id_carrera' => 'id_carrera']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUsuario()
    {
        return $this->hasOne(Usuario::className(), ['id_registro' => 'id_usuario']);
    }
}
