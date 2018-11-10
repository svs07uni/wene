<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Abarca;

/**
 * AbarcaSearch represents the model behind the search form of `app\models\Abarca`.
 */
class AbarcaSearch extends Abarca
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_abarca', 'id_dependencia', 'id_usuario'], 'integer'],
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
        $query = Abarca::find();

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
            'id_abarca' => $this->id_abarca,
            'id_dependencia' => $this->id_dependencia,
            'id_usuario' => $this->id_usuario,
        ]);

        return $dataProvider;
    }
}
