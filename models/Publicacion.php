<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "publicacion".
 *
 * @property int $id_publicacion
 * @property string $titulo
 * @property string $fecha
 * @property int $id_usuario
 *
 * @property Usuario $usuario
 */
class Publicacion extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'publicacion';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['titulo', 'id_usuario'], 'required'],
            [['titulo'], 'string'],
            [['fecha'], 'safe'],
            [['id_usuario'], 'default', 'value' => null],
            [['id_usuario'], 'integer'],
            [['id_usuario'], 'exist', 'skipOnError' => true, 'targetClass' => Usuario::className(), 'targetAttribute' => ['id_usuario' => 'id_registro']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_publicacion' => 'Id Publicacion',
            'titulo' => 'Titulo',
            'fecha' => 'Fecha',
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
