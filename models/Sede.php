<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "sede".
 *
 * @property int $id_sede
 * @property string $nombre
 * @property int $id_dependencia
 * @property int $id_localidad
 *
 * @property Convocatoria[] $convocatorias
 * @property Dependencia $dependencia
 * @property Localidad $localidad
 */
class Sede extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'sede';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nombre', 'id_dependencia', 'id_localidad'], 'required'],
            [['nombre'], 'string'],
            [['id_dependencia', 'id_localidad'], 'default', 'value' => null],
            [['id_dependencia', 'id_localidad'], 'integer'],
            [['id_dependencia'], 'exist', 'skipOnError' => true, 'targetClass' => Dependencia::className(), 'targetAttribute' => ['id_dependencia' => 'id_dependencia']],
            [['id_localidad'], 'exist', 'skipOnError' => true, 'targetClass' => Localidad::className(), 'targetAttribute' => ['id_localidad' => 'id_localidad']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_sede' => 'Id Sede',
            'nombre' => 'Nombre',
            'id_dependencia' => 'Id Dependencia',
            'id_localidad' => 'Id Localidad',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getConvocatorias()
    {
        return $this->hasMany(Convocatoria::className(), ['id_sede_pedido' => 'id_sede']);
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
    public function getLocalidad()
    {
        return $this->hasOne(Localidad::className(), ['id_localidad' => 'id_localidad']);
    }
}
