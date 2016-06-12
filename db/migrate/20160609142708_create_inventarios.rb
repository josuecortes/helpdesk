class CreateInventarios < ActiveRecord::Migration
  def change
    create_table :inventarios do |t|
      t.integer :departamento_id
      t.integer :quantidade
      t.string :estado
      t.text :observacoes

      t.timestamps null: false
    end
  end
end
