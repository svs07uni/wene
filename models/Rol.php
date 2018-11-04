<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "rol".
 *
 * @property int $id_rol
 * @property string $nombre
 *
 * @property RendimientoNoAcad[] $rendimientoNoAcads
 * @property Usuario[] $usuarios
 */
class Rol extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'rol';
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
            'id_rol' => 'Id Rol',
            'nombre' => 'Nombre',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRendimientoNoAcads()
    {
        return $this->hasMany(RendimientoNoAcad::className(), ['id_rol' => 'id_rol']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUsuarios()
    {
        return $this->hasMany(Usuario::className(), ['id_rol' => 'id_rol']);
    }
}
