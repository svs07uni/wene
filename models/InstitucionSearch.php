<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Institucion;

/**
 * InstitucionSearch represents the model behind the search form of `app\models\Institucion`.
 */
class InstitucionSearch extends Institucion
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_institucion'], 'integer'],
            [['nombre', 'email', 'telefono', 'direccion'], 'safe'],
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
        $query = Institucion::find();

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
            'id_institucion' => $this->id_institucion,
        ]);

        $query->andFilterWhere(['ilike', 'nombre', $this->nombre])
            ->andFilterWhere(['ilike', 'email', $this->email])
            ->andFilterWhere(['ilike', 'telefono', $this->telefono])
            ->andFilterWhere(['ilike', 'direccion', $this->direccion]);

        return $dataProvider;
    }
}
