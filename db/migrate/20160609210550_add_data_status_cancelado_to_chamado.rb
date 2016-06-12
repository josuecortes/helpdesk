class AddDataStatusCanceladoToChamado < ActiveRecord::Migration
  def change
    add_column :chamados, :data_status_cancelado, :datetime
  end
end
