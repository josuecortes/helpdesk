class AddTecnicoToUser < ActiveRecord::Migration
  def change
    add_column :users, :tecnico_id, :integer
  end
end
