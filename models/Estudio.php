<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "estudio".
 *
 * @property int $id_estudio
 * @property int $id_institucion
 * @property string $fecha_egreso
 * @property int $id_tipo
 * @property string $titulo
 * @property int $id_usuario
 *
 * @property Institucion $institucion
 * @property Usuario $usuario
 */
class Estudio extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'estudio';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_institucion', 'titulo', 'id_usuario'], 'required'],
            [['id_institucion', 'id_tipo', 'id_usuario'], 'default', 'value' => null],
            [['id_institucion', 'id_tipo', 'id_usuario'], 'integer'],
            [['fecha_egreso'], 'safe'],
            [['titulo'], 'string'],
            [['id_institucion'], 'exist', 'skipOnError' => true, 'targetClass' => Institucion::className(), 'targetAttribute' => ['id_institucion' => 'id_institucion']],
            [['id_usuario'], 'exist', 'skipOnError' => true, 'targetClass' => Usuario::className(), 'targetAttribute' => ['id_usuario' => 'id_registro']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_estudio' => 'Id Estudio',
            'id_institucion' => 'Id Institucion',
            'fecha_egreso' => 'Fecha Egreso',
            'id_tipo' => 'Id Tipo',
            'titulo' => 'Titulo',
            'id_usuario' => 'Id Usuario',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getInstitucion()
    {
        return $this->hasOne(Institucion::className(), ['id_institucion' => 'id_institucion']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUsuario()
    {
        return $this->hasOne(Usuario::className(), ['id_registro' => 'id_usuario']);
    }
}
