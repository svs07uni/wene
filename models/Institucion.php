<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "institucion".
 *
 * @property int $id_institucion
 * @property string $nombre
 * @property string $email
 * @property string $telefono
 * @property string $direccion
 *
 * @property Convocatoria[] $convocatorias
 * @property Estudio[] $estudios
 */
class Institucion extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'institucion';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nombre', 'email', 'telefono'], 'required'],
            [['nombre', 'email', 'telefono', 'direccion'], 'string'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_institucion' => 'Id Institucion',
            'nombre' => 'Nombre Institución',
            'email' => 'Correo electronico',
            'telefono' => 'Telefono',
            'direccion' => 'Direccion',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getConvocatorias()
    {
        return $this->hasMany(Convocatoria::className(), ['id_institucion' => 'id_institucion']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEstudios()
    {
        return $this->hasMany(Estudio::className(), ['id_institucion' => 'id_institucion']);
    }
}
