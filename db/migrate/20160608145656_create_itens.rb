class CreateItens < ActiveRecord::Migration
  def change
    create_table :itens do |t|
      t.string :nome

      t.timestamps null: false
    end
  end
end
