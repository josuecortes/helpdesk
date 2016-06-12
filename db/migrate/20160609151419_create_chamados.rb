class CreateChamados < ActiveRecord::Migration
  def change
    create_table :chamados do |t|
      t.integer :problema_id
      t.text :observacoes_usuario
      t.integer :user_id
      t.string :status
      t.datetime :data_status_aberto
      t.datetime :data_status_fechado
      t.datetime :data_status_em_atendimento
      t.datetime :data_status_concluido
      t.text :parecer_preliminar_tecnico
      t.text :parecer_final_tecnico
      t.text :motivo_cancelamento
      t.text :avaliacao_usuario
      t.integer :nivel_satisfacao_usuario

      t.timestamps null: false
    end
  end
end
