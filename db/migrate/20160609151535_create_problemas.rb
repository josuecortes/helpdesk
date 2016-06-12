class CreateProblemas < ActiveRecord::Migration
  def change
    create_table :problemas do |t|
      t.text :descricao
      t.text :solucao
      t.string :tipo

      t.timestamps null: false
    end
  end
end
