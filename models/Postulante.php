<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "postulante".
 *
 * @property int $id_postulante
 * @property int $id_usuario
 * @property int $id_convocatoria
 * @property string $fecha_postulado
 * @property int $id_estado
 * @property int $orden_merito
 *
 * @property Convocatoria $convocatoria
 * @property EstadoPostulante $estado
 * @property Usuario $usuario
 */
class Postulante extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'postulante';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_usuario', 'id_convocatoria', 'fecha_postulado'], 'required'],
            [['id_usuario', 'id_convocatoria', 'id_estado', 'orden_merito'], 'default', 'value' => null],
            [['id_usuario', 'id_convocatoria', 'id_estado', 'orden_merito'], 'integer'],
            [['fecha_postulado'], 'safe'],
            [['id_convocatoria'], 'exist', 'skipOnError' => true, 'targetClass' => Convocatoria::className(), 'targetAttribute' => ['id_convocatoria' => 'id_convocatoria']],
            [['id_estado'], 'exist', 'skipOnError' => true, 'targetClass' => EstadoPostulante::className(), 'targetAttribute' => ['id_estado' => 'id_estado']],
            [['id_usuario'], 'exist', 'skipOnError' => true, 'targetClass' => Usuario::className(), 'targetAttribute' => ['id_usuario' => 'id_registro']],
        	['orden_merito', 'compare', 'compareValue' => 100, 'operator' => '<=', 'type' => 'number'],
        	['orden_merito', 'compare', 'compareValue' => 0, 'operator' => '>=', 'type' => 'number'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_postulante' => 'Id Postulante',
            'id_usuario' => 'Id Usuario',
            'id_convocatoria' => 'Id Convocatoria',
            'fecha_postulado' => 'Fecha Postulado',
            'id_estado' => 'Id Estado',
            'orden_merito' => 'Orden Merito',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getConvocatoria()
    {
        return $this->hasOne(Convocatoria::className(), ['id_convocatoria' => 'id_convocatoria']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEstado()
    {
        return $this->hasOne(EstadoPostulante::className(), ['id_estado' => 'id_estado']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUsuario()
    {
        return $this->hasOne(Usuario::className(), ['id_registro' => 'id_usuario']);
    }
}
