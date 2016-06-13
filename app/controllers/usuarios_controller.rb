# -*- encoding : utf-8 -*-
class UsuariosController < ApplicationController
  
  load_and_authorize_resource :class=>"User", except: :create
  
  def index
    #@usuarios = usuario.all
    #@usuarios = User.accessible_by(current_ability).order('name ASC')
    @q = User.ransack(params[:q])
    @usuarios = @q.result.accessible_by(current_ability).order('name ASC').paginate(:page => params[:page], :per_page => @@per_page)
    
    
  end

  def show
    @usuario = User.accessible_by(current_ability).find(params[:id])  
    
  end

  def new
    @usuario = User.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @usuario }
    end
  end

  def autocomplete_departamento_nome
    term = params[:term]
    departamentos = Departamento.where('nome ilike ?',"%#{term}%").order(:nome).all
    render :json => departamentos.map { |departamento| {:id => departamento.id,:label => departamento.nome, :value => departamento.nome} }
  end

  def edit
    @usuario = User.accessible_by(current_ability).find(params[:id])
    
  end

  # POST /usuario
  # POST /usuario.json
  def create
    @usuario = User.new(user_params)
    @usuario.ativo = true
    @usuario.mudar_senha = true

    respond_to do |format|
      if @usuario.save
        flash[:notice] = @@msgs
        format.html { redirect_to usuarios_url }
        format.json { render json: @usuario, status: :created, location: @usuario }
      else
        flash[:alert] = @@msge
        format.html { render action: "new" }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
        
      end
    end
  end

  # PUT /usuario/1
  # PUT /usuario/1.json
  def update
    @usuario = User.find(params[:id])

    respond_to do |format|
      if @usuario.update_attributes(user_params)
        flash[:notice] = @@msgs
        format.html { redirect_to usuario_url }
        format.json { head :no_content }
      else
        flash[:alert] = @@msge
        format.html { render action: "edit" }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuario/1
  # DELETE /usuario/1.json
  def destroy #  -----------------------------------> DESATIVAR / ATIVAR
    @usuario = User.find(params[:id])
    if @usuario.ativo == true
      @usuario.ativo = false
    else
      @usuario.ativo = true
    end
    if @usuario.save!
      flash[:notice] = @@msgs
    else
      flash[:alert] = @@msge
    end

    redirect_to usuarios_url
  end

  def redefinir_senha
    @usuario = User.find(params[:usuario_id])
    @usuario.mudar_senha = true
    @usuario.password = @usuario.password_confirmation = "12345678"
    if @usuario.save(:validate=>false)
      redirect_to usuarios_url, notice: 'Senha redefinida com sucesso. Nova Senha = 12345678'
    else
      redirect_to usuarios_url, alert: 'Senha não foi redefinida, favor checar o cadastro.'
    end
  end

  private   

  def user_params
    params.require(:user).permit(:name, :departamento_id, :ativo, :mudar_senha, :email, :password, 
                                 :password_confirmation, :sign_in_count, :current_sign_in_at, 
                                 :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip,
                                 role_ids: [])
  end

end
