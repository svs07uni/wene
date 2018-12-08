<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Usuario;

/**
 * UsuariosSearch represents the model behind the search form of `app\models\Usuario`.
 */
class UsuariosSearch extends Usuario
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_registro', 'id_localidad', 'id_rol'], 'integer'],
            [['dni', 'telefono', 'nombre', 'apellido', 'nacionalidad', 'direccion', 'fecha_nac', 'foto', 'nombre_foto'], 'safe'],
            [['activo'], 'boolean'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Usuario::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id_registro' => $this->id_registro,
            'activo' => $this->activo,
            'id_localidad' => $this->id_localidad,
            'fecha_nac' => $this->fecha_nac,
            'id_rol' => $this->id_rol,
        ]);

        $query->andFilterWhere(['ilike', 'dni', $this->dni])
            ->andFilterWhere(['ilike', 'telefono', $this->telefono])
            ->andFilterWhere(['ilike', 'nombre', $this->nombre])
            ->andFilterWhere(['ilike', 'apellido', $this->apellido])
            ->andFilterWhere(['ilike', 'nacionalidad', $this->nacionalidad])
            ->andFilterWhere(['ilike', 'direccion', $this->direccion])
            ->andFilterWhere(['ilike', 'foto', $this->foto])
            ->andFilterWhere(['ilike', 'nombre_foto', $this->nombre_foto]);

        return $dataProvider;
    }
}
