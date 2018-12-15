<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Convocatoria;

/**
 * ConvocatoriaSearch represents the model behind the search form of `app\models\Convocatoria`.
 */
class ConvocatoriaSearch extends Convocatoria
{
    /**
     * {@inheritdoc}
     */
    public $institucion;
    public function rules()
    {
        return [
            [['id_convocatoria', 'cant_postulantes', 'id_tipo', 'id_sede_pedido', 'id_institucion'], 'integer'],
            [['titulo', 'descripcion', 'direccion', 'fecha_alta', 'fecha_desde', 'fecha_hasta', 'requisitos', 'institucion'], 'safe'],
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
        $query = Convocatoria::find();

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
            'id_convocatoria' => $this->id_convocatoria,
            'fecha_alta' => $this->fecha_alta,
            'fecha_desde' => $this->fecha_desde,
            'fecha_hasta' => $this->fecha_hasta,
            'cant_postulantes' => $this->cant_postulantes,
            'activo' => $this->activo,
            'id_tipo' => $this->id_tipo,
            'id_sede_pedido' => $this->id_sede_pedido,
            'id_institucion' => $this->id_institucion,
        ]);

        $query->andFilterWhere(['ilike', 'titulo', $this->titulo])
            ->andFilterWhere(['ilike', 'descripcion', $this->descripcion])
            ->andFilterWhere(['ilike', 'direccion', $this->direccion])
            ->andFilterWhere(['ilike', 'requisitos', $this->requisitos]);

        return $dataProvider;
    }
    public function searchAvanzado($params=null)
    {
        $query = Convocatoria::find();
        
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
            'id_convocatoria' => $this->id_convocatoria,
            'fecha_alta' => $this->fecha_alta,
            'fecha_desde' => $this->fecha_desde,
            'fecha_hasta' => $this->fecha_hasta,
            'cant_postulantes' => $this->cant_postulantes,
            'activo' => $this->activo,
            'id_tipo' => $this->id_tipo,
            'id_sede_pedido' => $this->id_sede_pedido,
            'id_institucion' => $this->id_institucion,
        ]);
        
        $query->orFilterWhere(['ilike', 'titulo', $this->titulo])
        ->orFilterWhere(['ilike', 'descripcion', $this->descripcion])
        ->orFilterWhere(['ilike', 'direccion', $this->direccion])
        ->orFilterWhere(['ilike', 'requisitos', $this->requisitos]);
        
        return $dataProvider;
    }
    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     * @param integer $id_usuario
     *
     * @return ActiveDataProvider
     */
    public function search_postulante($params,$id_usuario)
    {
        $query = Convocatoria::find()
                ->joinWith('postulantes')
                ->joinWith('institucion')
                ->andFilterWhere(['postulante.id_usuario' => $id_usuario]);
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
            //aca poner el filtro para la empresa
            //'id_institucion'=>$this->id_institucion,
            'id_convocatoria' => $this->id_convocatoria,
            'fecha_alta' => $this->fecha_alta,
            'fecha_desde' => $this->fecha_desde,
            'fecha_hasta' => $this->fecha_hasta,
            'cant_postulantes' => $this->cant_postulantes,
            'activo' => $this->activo,
            'id_tipo' => $this->id_tipo,
            'id_sede_pedido' => $this->id_sede_pedido,
            'id_institucion' => $this->id_institucion,
        ]);

        $query->andFilterWhere(['ilike', 'titulo', $this->titulo])
            ->andFilterWhere(['ilike', 'descripcion', $this->descripcion])
            ->andFilterWhere(['ilike', 'convocatoria.direccion', $this->direccion])
            ->andFilterWhere(['ilike', 'requisitos', $this->requisitos])
            ->andFilterWhere(['ilike', 'institucion.nombre', $this->institucion]);

        return $dataProvider;
    }
}
