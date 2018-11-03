<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "aptitud".
 *
 * @property int $id_aptitud
 * @property string $tipo
 * @property int $nivel
 * @property int $id_usuario
 *
 * @property Usuario $usuario
 */
class Aptitud extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'aptitud';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['tipo', 'id_usuario'], 'required'],
            [['tipo'], 'string'],
            [['nivel', 'id_usuario'], 'default', 'value' => null],
            [['nivel', 'id_usuario'], 'integer'],
            [['id_usuario'], 'exist', 'skipOnError' => true, 'targetClass' => Usuario::className(), 'targetAttribute' => ['id_usuario' => 'id_registro']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_aptitud' => 'Id Aptitud',
            'tipo' => 'Tipo',
            'nivel' => 'Nivel',
            'id_usuario' => 'Id Usuario',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUsuario()
    {
        return $this->hasOne(Usuario::className(), ['id_registro' => 'id_usuario']);
    }
}
