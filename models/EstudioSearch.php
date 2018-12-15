<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Estudio;

/**
 * EstudioSearch represents the model behind the search form of `app\models\Estudio`.
 */
class EstudioSearch extends Estudio
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_estudio',  'id_tipo', 'id_usuario'], 'integer'],
            [['fecha_egreso', 'institucion','titulo'], 'safe'],
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
    public function search($params,$id_usuario)
    {
        $query = Estudio::find();

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
            'id_estudio' => $this->id_estudio,
            'institucion' => $this->institucion,
            'fecha_egreso' => $this->fecha_egreso,
            'id_tipo' => $this->id_tipo,
            'id_usuario' => $this->id_usuario,
        ]);

        $query->andFilterWhere(['ilike', 'titulo', $this->titulo]);

        return $dataProvider;
    }
}
