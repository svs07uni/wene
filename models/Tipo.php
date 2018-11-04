<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "tipo".
 *
 * @property int $id_tipo
 * @property string $nombre
 *
 * @property Convocatoria[] $convocatorias
 * @property RendimientoNoAcad[] $rendimientoNoAcads
 */
class Tipo extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tipo';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nombre'], 'required'],
            [['nombre'], 'string'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_tipo' => 'Id Tipo',
            'nombre' => 'Nombre',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getConvocatorias()
    {
        return $this->hasMany(Convocatoria::className(), ['id_tipo' => 'id_tipo']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRendimientoNoAcads()
    {
        return $this->hasMany(RendimientoNoAcad::className(), ['id_tipo' => 'id_tipo']);
    }
}
