<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Experiencia;

/**
 * ExperienciaSearch represents the model behind the search form of `app\models\Experiencia`.
 */
class ExperienciaSearch extends Experiencia
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_experiencia', 'id_usuario'], 'integer'],
            [['titulo', 'descripcion'], 'safe'],
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
        $query = Experiencia::find()
        ->joinWith('usuario')
        ->andFilterWhere(['usuario.id_registro' => $id_usuario]);

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
            'id_experiencia' => $this->id_experiencia,
            'id_usuario' => $this->id_usuario,
        ]);

        $query->andFilterWhere(['ilike', 'titulo', $this->titulo])
            ->andFilterWhere(['ilike', 'descripcion', $this->descripcion]);

        return $dataProvider;
    }
}
