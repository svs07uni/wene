<?php

namespace app\models;

use app\models\Registro as DbUsuario;

class User extends \yii\base\BaseObject implements \yii\web\IdentityInterface
{
    public $id_registro;
    public $usuario;
    public $clave;
    public $email;
    public $fecha_registro;
    public $recuperar_clave;
    public $token;
   public $fecha_token;
   public $authKey;

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
        $dbUser = DbUsuario::find()
        ->where([
            "id_registro" => $id
        ])
        ->one();
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
        $dbUser = DbUsuario::find()
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
     * Validates password
     *
     * @param string $password password to validate
     * @return bool if password provided is valid for current user
     */
    public function validatePassword($password)
    {
        return $this->clave === $password;
    }
}
