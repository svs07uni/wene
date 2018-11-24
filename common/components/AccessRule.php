<?php
namespace app\common\components;
class AccessRule extends \yii\filters\AccessRule {
    
    /**
     * @inheritdoc
     */
    protected function matchRole($user)
    {
      /**  print_r($this->roles);
        print_r($user->identity->id_rol);
        exit();**/
        if (empty($this->roles)) {
            return true;
        }
        foreach ($this->roles as $role) {
            if ($role === '?') {
                if ($user->getIsGuest()) {
                    return true;
                }
            } elseif ($role === '@') {
                if (!$user->getIsGuest()) {
                    return true;
                }
                // Check if the user is logged in, and the roles match
            } elseif (!$user->getIsGuest() && $role === $user->identity->id_rol) {
                return true;
            }
        }
        
        return false;
    }
}