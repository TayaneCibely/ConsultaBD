class MedicosController < ApplicationController
  before_action :set_medico, only: %i[ show edit update destroy]

  def index
    @medico = Medico.all
  end

  def new
    @medico = Medico.new
  end

  def show
  end

  def edit
  end

  def search
    search_query = "%#{params[:query]}%"
    @medicos = Medico.where("nome LIKE :query OR crm LIKE :query", query: search_query)
  end

  def create
    @medico = Medico.new(medico_params)

    respond_to do |format|
      if @medico.save
        format.html { redirect_to medico_url(@medico), notice: "Médico criado com sucesso." }
        format.json { render :show, status: :created, location: @medico }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @medico.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @medico.update(medico_params)
        format.html { redirect_to medico_url(@medico), notice: "Médico atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @medico }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @medico.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @medico.destroy

    respond_to do |format|
      format.html { redirect_to medicos_url, notice: "Médico apagado com sucesso." }
      format.json { head :no_content }
    end
  end


  private

  def set_medico
    @medico = Medico.find(params[:id])
  end

  def medico_params
    params.require(:medico).permit(:nome, :crm, :uf_crm, :especialidade,:cpf, :email)
  end
end