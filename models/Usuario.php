<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "usuario".
 *
 * @property int $id_registro
 * @property string $dni
 * @property string $telefono
 * @property string $nombre
 * @property string $apellido
 * @property bool $activo
 * @property string $nacionalidad
 * @property string $direccion
 * @property int $id_localidad
 * @property string $fecha_nac
 * @property resource $foto
 * @property string $nombre_foto
 * @property int $id_rol
 * @property int $id_provincia //para la verificacion de 
 *
 * @property Aptitud[] $aptituds
 * @property Estudio[] $estudios
 * @property ExperienciaLaboral[] $experienciaLaborals
 * @property Postulante[] $postulantes
 * @property Publicacion[] $publicacions
 * @property RendimientoAcad[] $rendimientoAcads
 * @property RendimientoNoAcad[] $rendimientoNoAcads
 * @property Localidad $localidad
 * @property Registro $registro
 * @property Rol $rol
 */
class Usuario extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public $id_provincia;
    public static function tableName()
    {
        return 'usuario';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_registro', 'dni', 'nombre', 'apellido', 'nacionalidad', 'direccion', 'id_localidad', 'fecha_nac', 'id_rol'], 'required'],
            [['id_registro', 'id_localidad', 'id_rol'], 'default', 'value' => null],
            [['id_registro', 'id_localidad', 'id_rol'], 'integer'],
            [['dni', 'telefono', 'nombre', 'apellido', 'nacionalidad', 'direccion', 'foto', 'nombre_foto'], 'string'],
            [['activo'], 'boolean'],
            [['id_provincia'], 'integer'],
            [['fecha_nac'], 'safe'],
            [['id_registro'], 'unique'],
            [['id_localidad'], 'exist', 'skipOnError' => true, 'targetClass' => Localidad::className(), 'targetAttribute' => ['id_localidad' => 'id_localidad']],
            [['id_registro'], 'exist', 'skipOnError' => true, 'targetClass' => Registro::className(), 'targetAttribute' => ['id_registro' => 'id_registro']],
            [['id_rol'], 'exist', 'skipOnError' => true, 'targetClass' => Rol::className(), 'targetAttribute' => ['id_rol' => 'id_rol']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_registro' => 'Id Registro',
            'dni' => 'Dni',
            'telefono' => 'Telefono',
            'nombre' => 'Nombre',
            'apellido' => 'Apellido',
            'activo' => 'Activo',
            'nacionalidad' => 'Nacionalidad',
            'direccion' => 'Direccion',
            'id_localidad' => 'Id Localidad',
            'fecha_nac' => 'Fecha Nac',
            'foto' => 'Foto',
            'nombre_foto' => 'Nombre Foto',
            'id_rol' => 'Id Rol',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAptituds()
    {
        return $this->hasMany(Aptitud::className(), ['id_usuario' => 'id_registro']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEstudios()
    {
        return $this->hasMany(Estudio::className(), ['id_usuario' => 'id_registro']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getExperienciaLaborals()
    {
        return $this->hasMany(ExperienciaLaboral::className(), ['id_usuario' => 'id_registro']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPostulantes()
    {
        return $this->hasMany(Postulante::className(), ['id_usuario' => 'id_registro']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPublicacions()
    {
        return $this->hasMany(Publicacion::className(), ['id_usuario' => 'id_registro']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRendimientoAcads()
    {
        return $this->hasMany(RendimientoAcad::className(), ['id_usuario' => 'id_registro']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRendimientoNoAcads()
    {
        return $this->hasMany(RendimientoNoAcad::className(), ['id_usuario' => 'id_registro']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getLocalidad()
    {
        return $this->hasOne(Localidad::className(), ['id_localidad' => 'id_localidad']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRegistro()
    {
        return $this->hasOne(Registro::className(), ['id_registro' => 'id_registro']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRol()
    {
        return $this->hasOne(Rol::className(), ['id_rol' => 'id_rol']);
    }
}
