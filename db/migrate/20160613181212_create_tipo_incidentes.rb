class CreateTipoIncidentes < ActiveRecord::Migration
  def change
    create_table :tipo_incidentes do |t|
      t.string :descricao

      t.timestamps null: false
    end
  end
end
