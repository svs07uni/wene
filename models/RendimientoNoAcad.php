<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "rendimiento_no_acad".
 *
 * @property int $id_rendimiento
 * @property int $id_usuario
 * @property string $fecha_actualizado
 * @property string $titulo
 * @property string $descripcion
 * @property string $observacion
 * @property int $id_rol
 * @property int $horas_semanales
 * @property string $fecha_inicio
 * @property string $fecha_fin
 * @property string $norma_legal
 * @property int $id_tipo
 *
 * @property Rol $rol
 * @property Tipo $tipo
 * @property Usuario $usuario
 */
class RendimientoNoAcad extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'rendimiento_no_acad';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_usuario', 'fecha_actualizado', 'titulo', 'norma_legal'], 'required'],
            [['id_usuario', 'id_rol', 'horas_semanales', 'id_tipo'], 'default', 'value' => null],
            [['id_usuario', 'id_rol', 'horas_semanales', 'id_tipo'], 'integer'],
            [['fecha_actualizado', 'fecha_inicio', 'fecha_fin'], 'safe'],
            [['titulo', 'descripcion', 'observacion', 'norma_legal'], 'string'],
            [['id_rol'], 'exist', 'skipOnError' => true, 'targetClass' => Rol::className(), 'targetAttribute' => ['id_rol' => 'id_rol']],
            [['id_tipo'], 'exist', 'skipOnError' => true, 'targetClass' => Tipo::className(), 'targetAttribute' => ['id_tipo' => 'id_tipo']],
            [['id_usuario'], 'exist', 'skipOnError' => true, 'targetClass' => Usuario::className(), 'targetAttribute' => ['id_usuario' => 'id_registro']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_rendimiento' => 'Id Rendimiento',
            'id_usuario' => 'Id Usuario',
            'fecha_actualizado' => 'Fecha Actualizado',
            'titulo' => 'Titulo',
            'descripcion' => 'Descripcion',
            'observacion' => 'Observacion',
            'id_rol' => 'Id Rol',
            'horas_semanales' => 'Horas Semanales',
            'fecha_inicio' => 'Fecha Inicio',
            'fecha_fin' => 'Fecha Fin',
            'norma_legal' => 'Norma Legal',
            'id_tipo' => 'Id Tipo',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRol()
    {
        return $this->hasOne(Rol::className(), ['id_rol' => 'id_rol']);
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
    public function getUsuario()
    {
        return $this->hasOne(Usuario::className(), ['id_registro' => 'id_usuario']);
    }
}
