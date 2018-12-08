<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "estado_postulante".
 *
 * @property int $id_estado
 * @property string $nombre
 *
 * @property Postulante[] $postulantes
 */
class EstadoPostulante extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'estado_postulante';
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
            'id_estado' => 'Id Estado',
            'nombre' => 'Estado',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPostulantes()
    {
        return $this->hasMany(Postulante::className(), ['id_estado' => 'id_estado']);
    }
}
