class ExamesController < ApplicationController
  before_action :set_exame, only: %i[ show edit update destroy ]

  # GET /exames or /exames.json
  def index
    @consulta = Consulta.find(params[:consulta_id])
    @exames = @consulta.exames
  end

  # GET /exames/1 or /exames/1.json
  def show
    @consulta = Consulta.find(params[:consulta_id])
    @exame = Exame.find(params[:id])
  end


  # GET /exames/new
  def new
    @consulta = Consulta.find(params[:consulta_id])
    @exame = @consulta.exames.build
  end

  # GET /exames/1/edit
  def edit
    @consulta = Consulta.find(params[:consulta_id]) # Adicione esta linha
    @exame = Exame.find(params[:id])
  end

  # POST /exames or /exames.json
  def create
    @consulta = Consulta.find(params[:consulta_id])
    @exame = @consulta.exames.build(exame_params)

    respond_to do |format|
      if @exame.save
        format.html { redirect_to consulta_exame_url(@consulta, @exame), notice: "Exame was successfully created." }
        format.json { render :show, status: :created, location: @exame }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exame.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exames/1 or /exames/1.json
  def update
    respond_to do |format|
      if @exame.update(exame_params)
        format.html { redirect_to consulta_exame_url(@exame), notice: "Exame was successfully updated." }
        format.json { render :show, status: :ok, location: @exame }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exame.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exames/1 or /exames/1.json
  def destroy
    @exame.destroy

    respond_to do |format|
      format.html { redirect_to consulta_exames_url, notice: "Exame was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_exame
    @consulta = Consulta.find(params[:consulta_id]) # Adicione esta linha
    @exame = Exame.find_by(id: params[:id])
    if @exame.nil?
      redirect_to consulta_exames_path(@consulta), alert: "Exame não encontrado."
    end
  end

    # Only allow a list of trusted parameters through.
    def exame_params
      params.require(:exame).permit(:cod, :data, :nomeExame, :descricao, :resultado, :prontuario_id, :paciente_id)
    end
end
