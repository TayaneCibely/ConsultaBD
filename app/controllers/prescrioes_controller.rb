class PrescricoesController < ApplicationController
  before_action :set_prescricao, only: %i[ show edit update destroy ]

  # GET /prescricaos or /prescricaos.json
  def index
    @prescricaos = Prescricao.all
  end

  # GET /prescricaos/1 or /prescricaos/1.json
  def show
  end

  # GET /prescricaos/new
  def new
    @prescricao = Prescricao.new
  end

  # GET /prescricaos/1/edit
  def edit
  end

  # POST /prescricaos or /prescricaos.json
  def create
    @prescricao = Prescricao.new(prescricao_params)

    respond_to do |format|
      if @prescricao.save
        format.html { redirect_to prescricao_url(@prescricao), notice: "Prescricao was successfully created." }
        format.json { render :show, status: :created, location: @prescricao }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @prescricao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prescricaos/1 or /prescricaos/1.json
  def update
    respond_to do |format|
      if @prescricao.update(prescricao_params)
        format.html { redirect_to prescricao_url(@prescricao), notice: "Prescricao was successfully updated." }
        format.json { render :show, status: :ok, location: @prescricao }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @prescricao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prescricaos/1 or /prescricaos/1.json
  def destroy
    @prescricao.destroy

    respond_to do |format|
      format.html { redirect_to prescricaos_url, notice: "Prescricao was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prescricao
      @prescricao = Prescricao.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def prescricao_params
      params.require(:prescricao).permit(:cod, :data, :dosagem, :observacoes, :listaMedicamentos)
    end
end
