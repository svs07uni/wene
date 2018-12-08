<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "dependencia".
 *
 * @property int $id_dependencia
 * @property string $nombre
 * @property string $sigla
 *
 * @property Carrera[] $carreras
 * @property Sede[] $sedes
 */
class Dependencia extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'dependencia';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nombre', 'sigla'], 'required'],
            [['nombre', 'sigla'], 'string'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_dependencia' => 'Id Dependencia',
            'nombre' => 'Nombre',
            'sigla' => 'Sigla',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCarreras()
    {
        return $this->hasMany(Carrera::className(), ['id_dependencia' => 'id_dependencia']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSedes()
    {
        return $this->hasMany(Sede::className(), ['id_dependencia' => 'id_dependencia']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAbarcas()
    {
        return $this->hasMany(Abarca::className(), ['id_dependencia' => 'id_dependencia']);
    }
}
