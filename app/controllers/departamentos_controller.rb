class DepartamentosController < ApplicationController
  before_action :set_departamento, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :class=>"Departamento", except: :create
  
  # GET /departamentos
  # GET /departamentos.json
  def index
    #@escolas = Escola.all
    @q = Departamento.ransack(params[:q])
    @departamentos = @q.result.accessible_by(current_ability).order('nome ASC').paginate(:page => params[:page], :per_page => @@per_page)
    
  end

  # GET /departamentos/1
  # GET /departamentos/1.json
  def show
  end

  # GET /departamentos/new
  def new
    @departamento = Departamento.new
  end

  # GET /departamentos/1/edit
  def edit
  end

  # POST /departamentos
  # POST /departamentos.json
  def create
    @departamento = Departamento.new(departamento_params)

    respond_to do |format|
      if @departamento.save
        format.html { redirect_to @departamento, notice: @@msgs }
        format.json { render :show, status: :created, location: @departamento }
      else
        format.html { render :new }
        format.json { render json: @departamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /departamentos/1
  # PATCH/PUT /departamentos/1.json
  def update
    respond_to do |format|
      if @departamento.update(departamento_params)
        format.html { redirect_to @departamento, notice: @@msgs }
        format.json { render :show, status: :ok, location: @departamento }
      else
        format.html { render :edit }
        format.json { render json: @departamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departamentos/1
  # DELETE /departamentos/1.json
  def destroy
    @departamento.destroy
    respond_to do |format|
      format.html { redirect_to departamentos_url, notice: @@msgs }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_departamento
      @departamento = Departamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def departamento_params
      params.require(:departamento).permit(:nome, :sigla, :email, :telefone)
    end
end
