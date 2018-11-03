<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "carrera".
 *
 * @property int $id_carrera
 * @property string $nombre
 * @property int $anios
 * @property int $cant_materias
 * @property int $id_dependencia
 *
 * @property Dependencia $dependencia
 * @property CarreraDestinada[] $carreraDestinadas
 * @property Convocatoria[] $convocatorias
 * @property RendimientoAcad[] $rendimientoAcads
 */
class Carrera extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'carrera';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nombre', 'anios', 'cant_materias', 'id_dependencia'], 'required'],
            [['nombre'], 'string'],
            [['anios', 'cant_materias', 'id_dependencia'], 'default', 'value' => null],
            [['anios', 'cant_materias', 'id_dependencia'], 'integer'],
            [['id_dependencia'], 'exist', 'skipOnError' => true, 'targetClass' => Dependencia::className(), 'targetAttribute' => ['id_dependencia' => 'id_dependencia']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_carrera' => 'Id Carrera',
            'nombre' => 'Nombre',
            'anios' => 'Anios',
            'cant_materias' => 'Cant Materias',
            'id_dependencia' => 'Id Dependencia',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDependencia()
    {
        return $this->hasOne(Dependencia::className(), ['id_dependencia' => 'id_dependencia']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCarreraDestinadas()
    {
        return $this->hasMany(CarreraDestinada::className(), ['id_carrera' => 'id_carrera']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getConvocatorias()
    {
        return $this->hasMany(Convocatoria::className(), ['id_convocatoria' => 'id_convocatoria'])->viaTable('carrera_destinada', ['id_carrera' => 'id_carrera']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRendimientoAcads()
    {
        return $this->hasMany(RendimientoAcad::className(), ['id_carrera' => 'id_carrera']);
    }
}
