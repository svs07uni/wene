<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Rendimiento_acad;

/**
 * Rendimiento_acadSearch represents the model behind the search form of `app\models\Rendimiento_acad`.
 */
class Rendimiento_acadSearch extends Rendimiento_acad
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_rendimiento', 'id_usuario', 'cant_mat_aprobadas', 'anio_carrera', 'id_carrera'], 'integer'],
            [['fecha_actualizado', 'legajo', 'fecha_egreso'], 'safe'],
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
        $query = Rendimiento_acad::find();

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
            'id_rendimiento' => $this->id_rendimiento,
            'id_usuario' => $this->id_usuario,
            'fecha_actualizado' => $this->fecha_actualizado,
            'cant_mat_aprobadas' => $this->cant_mat_aprobadas,
            'anio_carrera' => $this->anio_carrera,
            'fecha_egreso' => $this->fecha_egreso,
            'id_carrera' => $this->id_carrera,
        ]);

        $query->andFilterWhere(['ilike', 'legajo', $this->legajo]);

        return $dataProvider;
    }
}
