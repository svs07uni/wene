<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "registro".
 *
 * @property int $id_registro
 * @property string $usuario
 * @property string $clave
 * @property string $email
 * @property string $fecha_registro
 * @property string $token
 * @property bool $recuperar_clave
 * @property string $fecha_token
 *
 * @property Usuario $usuario0
 */
class Registro extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'registro';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['usuario', 'clave'], 'required'],
            [[ 'fecha_registro'],'date'],
            [['usuario', 'clave', 'email', 'token'], 'string'],
            [['fecha_registro', 'fecha_token'], 'safe'],
            [['recuperar_clave'], 'boolean'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_registro' => 'Id Registro',
            'usuario' => 'Usuario',
            'clave' => 'Clave',
            'email' => 'Email',
            'fecha_registro' => 'Fecha Registro',
            'token' => 'Token',
            'recuperar_clave' => 'Recuperar Clave',
            'fecha_token' => 'Fecha Token',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUsuario0()
    {
        return $this->hasOne(Usuario::className(), ['id_registro' => 'id_registro']);
    }
}
