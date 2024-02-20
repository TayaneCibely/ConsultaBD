class ProntuariosController < ApplicationController
  before_action :set_prontuario, only: %i[ show edit update destroy ]

  # GET /prontuarios or /prontuarios.json
  def index
    @prontuarios = Prontuario.all
  end

  # GET /prontuarios/1 or /prontuarios/1.json
  def show

  end

  # GET /prontuarios/new
  def new
    @prontuario = Prontuario.new
  end

  # GET /prontuarios/1/edit
  def edit
  end

  # POST /prontuarios or /prontuarios.json
  def create
    @prontuario = Prontuario.new(prontuario_params)

    respond_to do |format|
      if @prontuario.save
        format.html { redirect_to prontuario_url(@prontuario), notice: "Prontuario was successfully created." }
        format.json { render :show, status: :created, location: @prontuario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @prontuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prontuarios/1 or /prontuarios/1.json
  def update
    respond_to do |format|
      if @prontuario.update(prontuario_params)
        format.html { redirect_to prontuario_url(@prontuario), notice: "Prontuario was successfully updated." }
        format.json { render :show, status: :ok, location: @prontuario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @prontuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prontuarios/1 or /prontuarios/1.json
  def destroy
    @prontuario.destroy

    respond_to do |format|
      format.html { redirect_to prontuarios_url, notice: "Prontuario was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prontuario
      @prontuario = Prontuario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def prontuario_params
      params.require(:prontuario).permit(:dataCriacao, :codigo, :historico)
    end
end
