class HomeController < ApplicationController
  def index
  	@meus_chamados = Chamado.where('user_id = ?', current_user.id)
  	@chamados = Chamado.all
  	@usuarios = User.all
   	@incidentes = Incidente.order('data_inicio DESC').limit(3)


   	@abertos = Chamado.where(:status=>"ABERTO").order('created_at ASC')
   	@atendendo = Chamado.where(:status=>"EM ATENDIMENTO",:tecnico_id=>current_user.id).order('data_status_em_atendimento ASC')

  end

  def nao_autorizado
  end
end
