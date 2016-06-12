class RemoveTecnicoIdFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :tecnico_id, :integer
  end
end
