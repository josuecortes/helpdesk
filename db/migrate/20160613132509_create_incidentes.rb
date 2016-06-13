class CreateIncidentes < ActiveRecord::Migration
  def change
    create_table :incidentes do |t|
      t.text :descricao
      t.datetime :data_inicio
      t.datetime :data_fim
      t.datetime :previsao_fim
      t.text :status
      t.text :observacoes
      t.integer :tipo_incidente_id

      t.timestamps null: false
    end
  end
end
