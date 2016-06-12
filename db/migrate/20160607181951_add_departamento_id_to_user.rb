class AddDepartamentoIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :departamento_id, :integer
  end
end
