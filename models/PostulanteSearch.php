<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Postulante;

/**
 * PostulanteSearch represents the model behind the search form of `app\models\Postulante`.
 */
class PostulanteSearch extends Postulante
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_postulante', 'id_usuario', 'id_convocatoria', 'id_estado', 'orden_merito'], 'integer'],
            [['fecha_postulado'], 'safe'],
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
        $query = Postulante::find();

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
            'id_postulante' => $this->id_postulante,
            'id_usuario' => $this->id_usuario,
            'id_convocatoria' => $this->id_convocatoria,
            'fecha_postulado' => $this->fecha_postulado,
            'id_estado' => $this->id_estado,
            'orden_merito' => $this->orden_merito,
        ]);

        return $dataProvider;
    }
}
