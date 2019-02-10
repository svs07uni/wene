<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "convocatoria".
 *
 * @property int $id_convocatoria
 * @property string $titulo
 * @property string $descripcion
 * @property string $direccion
 * @property string $fecha_alta
 * @property string $fecha_desde
 * @property string $fecha_hasta
 * @property int $cant_postulantes
 * @property bool $activo
 * @property int $id_tipo
 * @property int $id_sede_pedido
 * @property int $id_institucion
 * @property string $requisitos
 *
 * @property CarreraDestinada[] $carreraDestinadas
 * @property Carrera[] $carreras
 * @property Institucion $institucion
 * @property Sede $sedePedido
 * @property Tipo $tipo
 * @property Postulante[] $postulantes
 */
class Convocatoria extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'convocatoria';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['titulo', 'direccion', 'fecha_alta', 'fecha_desde', 'fecha_hasta', 'id_institucion'], 'required'],
            [['titulo', 'descripcion', 'direccion', 'requisitos'], 'string'],
            [['fecha_alta', 'fecha_desde', 'fecha_hasta'], 'safe'],
            [['cant_postulantes', 'id_tipo', 'id_sede_pedido', 'id_institucion'], 'default', 'value' => null],
            [['cant_postulantes', 'id_tipo', 'id_sede_pedido', 'id_institucion'], 'integer'],
            [['activo'], 'boolean'],
            [['id_institucion'], 'exist', 'skipOnError' => true, 'targetClass' => Institucion::className(), 'targetAttribute' => ['id_institucion' => 'id_institucion']],
            [['id_sede_pedido'], 'exist', 'skipOnError' => true, 'targetClass' => Sede::className(), 'targetAttribute' => ['id_sede_pedido' => 'id_sede']],
            [['id_tipo'], 'exist', 'skipOnError' => true, 'targetClass' => Tipo::className(), 'targetAttribute' => ['id_tipo' => 'id_tipo']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_convocatoria' => 'Convocatoria numero',
            'titulo' => 'Titulo de convocatoria',
            'descripcion' => 'Descripcion',
            'direccion' => 'Direccion',
            'fecha_alta' => 'Fecha Alta',
            'fecha_desde' => 'Fecha Desde',
            'fecha_hasta' => 'Fecha Hasta',
            'cant_postulantes' => 'Cant Postulantes Requeridos',
            'activo' => 'Activo',
            'id_tipo' => 'Id Tipo',
            'id_sede_pedido' => 'Id Sede Pedido',
            'id_institucion' => 'Id Institucion',
            'requisitos' => 'Requisitos',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCarreraDestinadas()
    {
        return $this->hasMany(CarreraDestinada::className(), ['id_convocatoria' => 'id_convocatoria']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCarreras()
    {
        return $this->hasMany(Carrera::className(), ['id_carrera' => 'id_carrera'])->viaTable('carrera_destinada', ['id_convocatoria' => 'id_convocatoria']);
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
    public function getSedePedido()
    {
        return $this->hasOne(Sede::className(), ['id_sede' => 'id_sede_pedido']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTipo()
    {
        return $this->hasOne(Tipo::className(), ['id_tipo' => 'id_tipo']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPostulantes()
    {
        return $this->hasMany(Postulante::className(), ['id_convocatoria' => 'id_convocatoria']);
    }
}
