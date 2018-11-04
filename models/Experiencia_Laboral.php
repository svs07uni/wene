<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "experiencia_laboral".
 *
 * @property int $id_experiencia
 * @property int $id_usuario
 * @property string $titulo
 * @property string $descripcion
 *
 * @property Usuario $usuario
 */
class Experiencia_Laboral extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'experiencia_laboral';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_usuario', 'titulo'], 'required'],
            [['id_usuario'], 'default', 'value' => null],
            [['id_usuario'], 'integer'],
            [['titulo', 'descripcion'], 'string'],
            [['id_usuario'], 'exist', 'skipOnError' => true, 'targetClass' => Usuario::className(), 'targetAttribute' => ['id_usuario' => 'id_registro']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_experiencia' => 'Id Experiencia',
            'id_usuario' => 'Id Usuario',
            'titulo' => 'Titulo',
            'descripcion' => 'Descripcion',
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
