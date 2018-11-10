<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "abarca".
 *
 * @property int $id_abarca
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
            [['id_abarca', 'id_dependencia', 'id_usuario'], 'required'],
            [['id_abarca', 'id_dependencia', 'id_usuario'], 'default', 'value' => null],
            [['id_abarca', 'id_dependencia', 'id_usuario'], 'integer'],
            [['id_abarca'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_abarca' => 'Id Abarca',
            'id_dependencia' => 'Id Dependencia',
            'id_usuario' => 'Id Usuario',
        ];
    }
}
