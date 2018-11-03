<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "carrera_destinada".
 *
 * @property int $id_convocatoria
 * @property int $id_carrera
 * @property int $anios_necesario
 * @property int $cant_materias_nec
 *
 * @property Carrera $carrera
 * @property Convocatoria $convocatoria
 */
class Carrera_Destinada extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'carrera_destinada';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_convocatoria', 'id_carrera'], 'required'],
            [['id_convocatoria', 'id_carrera', 'anios_necesario', 'cant_materias_nec'], 'default', 'value' => null],
            [['id_convocatoria', 'id_carrera', 'anios_necesario', 'cant_materias_nec'], 'integer'],
            [['id_convocatoria', 'id_carrera'], 'unique', 'targetAttribute' => ['id_convocatoria', 'id_carrera']],
            [['id_carrera'], 'exist', 'skipOnError' => true, 'targetClass' => Carrera::className(), 'targetAttribute' => ['id_carrera' => 'id_carrera']],
            [['id_convocatoria'], 'exist', 'skipOnError' => true, 'targetClass' => Convocatoria::className(), 'targetAttribute' => ['id_convocatoria' => 'id_convocatoria']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_convocatoria' => 'Id Convocatoria',
            'id_carrera' => 'Id Carrera',
            'anios_necesario' => 'Anios Necesario',
            'cant_materias_nec' => 'Cant Materias Nec',
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
    public function getConvocatoria()
    {
        return $this->hasOne(Convocatoria::className(), ['id_convocatoria' => 'id_convocatoria']);
    }
}
