<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "abarca".
 *
 * @property int $id_dependencia
 * @property int $id_usuario
 */
class Abarca extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'abarca';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_dependencia', 'id_usuario'], 'required'],
            [['id_dependencia', 'id_usuario'], 'integer'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_dependencia' => 'Id Dependencia',
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

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDependencia()
    {
        return $this->hasOne(Dependencia::className(), ['id_dependencia' => 'id_dependencia']);
    }
}
