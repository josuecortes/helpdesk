class Ability
  include CanCan::Ability

  ADMINISTRADOR = Role.where(:nome=>"ADMINISTRADOR").first
  TECNICO = Role.where(:nome=>"TECNICO").first
  REQUISITANTE = Role.where(:nome=>"REQUISITANTE").first
                        
  def initialize(user)
    
    if user.roles.include?ADMINISTRADOR
      can :manage, :all      
    end 

    if user.roles.include?TECNICO
    	can :manage, Role, Role.where(:nome != 'ADMINISTRADOR')
      can :manage, Problema
      can :manage, User#, {:role_id.not_in=>Role.where(:nome.in=>["ADMINISTRADOR"]).collect{|r|r.id}}
      can :manage, Inventario
      can :manage, Departamento
      can :manage, Item
      can :manage, Incidente
      

      can :manage, Chamado#, Chamado.where(:user_id != user.id)
      #cannot :fechar_chamado, Chamado, Chamado.where(:user_id != user.id)
      

    	#cannot :pegar_chamado, Chamado, Chamado.where(:status != "ABERTO")
      #can :pegar_chamado, Chamado, Chamado.where(:status=>"ABERTO")

      #cannot :concluir_chamado, Chamado, Chamado.where(:status != "EM ATENDIMENTO", :tecnico_id != user.id)
    	#can :concluir_chamado, Chamado, {:status=>"EM ATENDIMENTO", :tecnico_id=>user.id}
    end

    if user.roles.include?REQUISITANTE
      
      #can :manage, Chamado, {:user_id=>user.id}
      can :manage, Chamado, :user_id => user.id
      #cannot :pegar_chamado, Chamado
      #cannot :cancelar_chamado, {:status=>'ABERTO'} 
      #cannot :cancelar_chamado, Chamado, status: ['ABERTO', 'CONCLUIDO'] 
      #cannot :concluir_chamado, Chamado
      #cannot :delete, Chamado

      can :update, User, User.where(:id=>user.id)

      can :read, Incidente

      #cannot
    	#can :edit, Chamado.where(:user_id=>user.id, :status=>"ABERTO")
    	#can :fechar_chamado, Chamado.where(user_id=>user.id, :status=>'CONCLUIDO')
    	#can :cancelar_chamado, Chamado.where(user_id=>user.id, :status.in=>(['ABERTO','EM ATENDIMENTO']))
    end

  end
end
