class AddTecnicoIdToChamado < ActiveRecord::Migration
  def change
    add_column :chamados, :tecnico_id, :integer
  end
end
