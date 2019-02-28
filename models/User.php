<?php

namespace app\models;

use app\models\Usuario as DbUsuario;
use Yii;

class User extends \yii\base\BaseObject implements \yii\web\IdentityInterface
{
    public $id_registro;
    public $token;
    public $authKey;
    
    public $dni;
    public $telefono;
    public $nombre;
    public $apellido;
    public $activo;
    public $nacionalidad;
    public $direccion;
    public $id_localidad;
    public $fecha_nac;
    public $foto;
    public $nombre_foto;
    public  $id_rol;
    
    
    const ROLE_GESTOR = 3;
    const ROLE_POSTULANTE = 1;
    const ROLE_ADMIN = 4;
    const ROLE_SELECTOR = 2;

 /*   private static $users = [
        '100' => [
            'id' => '100',
            'username' => 'admin',
            'password' => 'admin',
            'authKey' => 'test100key',
            'accessToken' => '100-token',
        ],
        '101' => [
            'id' => '101',
            'username' => 'demo',
            'password' => 'demo',
            'authKey' => 'test101key',
            'accessToken' => '101-token',
        ],
        ];*/ 

    public static function findIdentity($id) {
        $dbUser = DbUsuario::find()->joinWith("registro")->where([ "usuario.id_registro" => $id])->one();
        if ($dbUser == null) {
            return null;
        }
        return new static($dbUser);
    }
    
    public static function findIdentityByAccessToken($token, $userType = null) {
        
        $dbUser = DbUsuario::find()
        ->where(["token" => $toke])
        ->one();
            if (!count($dbUser)) {
                return null;
            }
        return new static($dbUser);
    }
    public static function findByUsername($username) {
        
        $dbUser = DbUsuario::find()->joinWith("registro")
        ->where([
            "usuario" => $username
        ])
        ->one();
        if ($dbUser == null) {
            return null;
        }
        return new static($dbUser);
    }
    /**
     * {@inheritdoc}
     *
    public static function findIdentity($id)
    {
        return isset(self::$users[$id]) ? new static(self::$users[$id]) : null;
    }

    /**
     * {@inheritdoc}
     *
    public static function findIdentityByAccessToken($token, $type = null)
    {
        foreach (self::$users as $user) {
            if ($user['accessToken'] === $token) {
                return new static($user);
            }
        }

        return null;
    }

    /**
     * Finds user by username
     *
     * @param string $username
     * @return static|null
     *
    public static function findByUsername($username)
    {
        foreach (self::$users as $user) {
            if (strcasecmp($user['username'], $username) === 0) {
                return new static($user);
            }
        }

        return null;
    }

    /**
     * {@inheritdoc}
     */
    public function getId()
    {
        return $this->id_registro;
    }

    /**
     * {@inheritdoc}
     */
    public function getAuthKey()
    {
        return $this->authKey;
    }

    /**
     * {@inheritdoc}
     */
    public function validateAuthKey($authKey)
    {
        return $this->authKey === $authKey;
    }

    /**
     * @return mixed
     */
    public function getNombre()
    {
        return $this->nombre;
    }

    /**
     * @return mixed
     */
    public function getApellido()
    {
        return $this->apellido;
    }

    /**
     * @param mixed $nombre
     */
    public function setNombre($nombre)
    {
        $this->nombre = $nombre;
    }

    /**
     * @param mixed $apellido
     */
    public function setApellido($apellido)
    {
        $this->apellido = $apellido;
    }

    /**
     * @param mixed $dni
     */
    public function getDni()
    {
        return $this->dni;
    }

    /**
     * Validates password
     *
     * @param string $password password to validate
     * @return bool if password provided is valid for current user
     */
    public function validatePassword($password)
    {
        $dbUser = Registro::find()
        ->select("clave")
        ->where([
            "id_registro" => $this->id_registro
        ])
        ->one();
        if( Yii::$app->getSecurity()->validatePassword($password, $dbUser->clave))
        {
            return true;
        }else {
            return false;
        }
    }
}
