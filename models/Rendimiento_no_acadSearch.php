<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Rendimiento_no_acad;

/**
 * Rendimiento_no_acadSearch represents the model behind the search form of `app\models\Rendimiento_no_acad`.
 */
class Rendimiento_no_acadSearch extends Rendimiento_no_acad
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_rendimiento', 'id_usuario', 'id_rol', 'horas_semanales', 'id_tipo'], 'integer'],
            [['fecha_actualizado', 'titulo', 'descripcion', 'observacion', 'fecha_inicio', 'fecha_fin', 'norma_legal'], 'safe'],
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
        $query = Rendimiento_no_acad::find();

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
            'id_rol' => $this->id_rol,
            'horas_semanales' => $this->horas_semanales,
            'fecha_inicio' => $this->fecha_inicio,
            'fecha_fin' => $this->fecha_fin,
            'id_tipo' => $this->id_tipo,
        ]);

        $query->andFilterWhere(['ilike', 'titulo', $this->titulo])
            ->andFilterWhere(['ilike', 'descripcion', $this->descripcion])
            ->andFilterWhere(['ilike', 'observacion', $this->observacion])
            ->andFilterWhere(['ilike', 'norma_legal', $this->norma_legal]);

        return $dataProvider;
    }
}
