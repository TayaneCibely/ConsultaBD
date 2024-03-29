class ProntuariosController < ApplicationController
  before_action :set_paciente, only: [:show, :create, :edit, :update, :destroy]
  before_action :set_prontuario, only: %i[ show edit update destroy ]

  # GET /prontuarios or /prontuarios.json
  def index
    @prontuarios = Prontuario.all
  end

  # GET /prontuarios/1 or /prontuarios/1.json
  def show
    @prontuario = Prontuario.find(params[:id])
    @paciente = @prontuario.paciente if @prontuario
  end

  # GET /prontuarios/new
  def new
    @paciente = Paciente.find(params[:paciente_id])
    @prontuario = @paciente.build_prontuario
  rescue ActiveRecord::RecordNotFound
    redirect_to pacientes_path, alert: 'Paciente não encontrado.'
  end


  # GET /prontuarios/1/edit
  def edit
  end

  # POST /prontuarios or /prontuarios.json
  def create
    @paciente = Paciente.find(params[:paciente_id])
    @prontuario_existente = @paciente.prontuario

    if @prontuario_existente
      flash[:notice] = 'Paciente já possui um prontuário.'
      redirect_to paciente_prontuario_path(@paciente, @prontuario_existente)
    else
      @prontuario = @paciente.build_prontuario(prontuario_params)

      respond_to do |format|
        if @prontuario.save
          format.html { redirect_to paciente_prontuarios_url(@paciente), notice: 'Prontuario was successfully created.' }
          format.json { render :show, status: :created, location: @prontuario }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end
  end


  # PATCH/PUT /prontuarios/1 or /prontuarios/1.json
  def update
    respond_to do |format|
      if @prontuario.update(prontuario_params)
        format.html { redirect_to paciente_prontuarios_url(@paciente, @prontuario), notice: "Prontuario was successfully updated." }
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
      format.html { redirect_to paciente_prontuarios_url, notice: "Prontuario was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_paciente
    Rails.logger.info "Procurando por paciente com ID: #{params[:paciente_id]}"
    @paciente = Paciente.find_by(id: params[:paciente_id])

    if @paciente
      Rails.logger.info "Paciente encontrado: #{@paciente.inspect}"
    else
      Rails.logger.error "Paciente não encontrado com ID: #{params[:paciente_id]}"
      redirect_to pacientes_path, alert: 'Paciente não encontrado.'
    end
  end

  def set_prontuario
    @prontuario = Prontuario.find(params[:id])
  end


  def prontuario_params
    params.require(:prontuario).permit(:datacriacao, :codigo, :historico)
  end
end
