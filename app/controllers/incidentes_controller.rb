class IncidentesController < ApplicationController
  before_action :set_incidente, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :class=>"Incidente", except: :create

  # GET /incidentes
  # GET /incidentes.json
  def index
    #@incidentes = Incidente.all
    @q = Incidente.ransack(params[:q])
    @incidentes = @q.result.accessible_by(current_ability).order('data_inicio DESC').paginate(:page => params[:page], :per_page => @@per_page)
  end

  # GET /incidentes/1data_inicio DESC GET /incidentes/1.json
  def show
  end

  # GET /incidentes/new
  def new
    @incidente = Incidente.new
  end

  # GET /incidentes/1/edit
  def edit
  end

  # POST /incidentes
  # POST /incidentes.json
  def create
    @incidente = Incidente.new(incidente_params)

    respond_to do |format|
      if @incidente.save
        format.html { redirect_to @incidente, notice: @@msgs }
        format.json { render :show, status: :created, location: @incidente }
      else
        format.html { render :new }
        format.json { render json: @incidente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incidentes/1
  # PATCH/PUT /incidentes/1.json
  def update
    respond_to do |format|
      if @incidente.update(incidente_params)
        format.html { redirect_to @incidente, notice: @@msgs }
        format.json { render :show, status: :ok, location: @incidente }
      else
        format.html { render :edit }
        format.json { render json: @incidente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incidentes/1
  # DELETE /incidentes/1.json
  def destroy
    @incidente.destroy
    respond_to do |format|
      format.html { redirect_to incidentes_url, @@msgs }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incidente
      @incidente = Incidente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incidente_params
      params.require(:incidente).permit(:descricao, :data_inicio, :data_fim, :previsao_fim, :status, :observacoes, :tipo_incidente_id)
    end
end