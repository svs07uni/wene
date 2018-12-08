<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "localidad".
 *
 * @property int $id_localidad
 * @property string $nombre
 * @property string $sigla
 * @property int $cod_postal
 * @property int $caracteristica
 *
 * @property Sede[] $sedes
 * @property Usuario[] $usuarios
 */
class Localidad extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'localidad';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nombre', 'sigla', 'cod_postal', 'caracteristica'], 'required'],
            [['nombre', 'sigla'], 'string'],
            [['cod_postal', 'caracteristica'], 'default', 'value' => null],
            [['cod_postal', 'caracteristica'], 'integer'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_localidad' => 'Id Localidad',
            'nombre' => 'Nombre',
            'sigla' => 'Sigla',
            'cod_postal' => 'Cod Postal',
            'caracteristica' => 'Caracteristica',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSedes()
    {
        return $this->hasMany(Sede::className(), ['id_localidad' => 'id_localidad']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUsuarios()
    {
        return $this->hasMany(Usuario::className(), ['id_localidad' => 'id_localidad']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProvincia()
    {
        return $this->hasOne(Provincia::className(), ['id_provincia' => 'id_provincia']);
    }
}
