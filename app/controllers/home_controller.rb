class HomeController < ApplicationController
  def index
  	@meus_chamados = Chamado.where('user_id = ?', current_user.id)
  	@chamados = Chamado.all
  	@usuarios = User.all
  end

  def nao_autorizado
  end
end
