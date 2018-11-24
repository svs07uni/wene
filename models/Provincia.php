<?php

namespace app\models;

use Yii;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "provincia".
 *
 * @property int $id_provincia
 * @property string $nombre
 */
class Provincia extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'provincia';
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
            'id_provincia' => 'Id Provincia',
            'nombre' => 'Nombre',
        ];
    }

    public function getLocalidades()
    {
        return $this->hasMany(Localidad::className(), ['id_provincia' => 'id_provincia']);
    }

    public function obtenerLocalidadesArray()
    {
         $localidades = Localidad::find()->where(['id_provincia' => $this->id_provincia])->all();
         return ArrayHelper::toArray($localidades, [
            'app\models\Localidad' => [
                'id'=>'id_localidad',
                'name'=>'nombre'
            ]
        ]);
    }

}
