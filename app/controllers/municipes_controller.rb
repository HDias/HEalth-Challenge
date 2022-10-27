class MunicipesController < ApplicationController
  before_action :set_municipe, only: %i[show edit update destroy]

  def index
    @municipes = Municipe.all.includes(:endereco)
  end

  def new
    @municipe = Municipe.new
    @municipe.build_endereco
  end

  def edit; end

  def create
    @municipe = Municipe.new(municipe_params)

    respond_to do |format|
      if @municipe.save
        format.html { redirect_to municipes_url, notice: 'Munícipe criado com sucesso' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @municipe.update(municipe_params)
        format.html { redirect_to municipe_url(@municipe), notice: 'Munícipe atualizado com sucesso.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_municipe
    @municipe = Municipe.find(params[:id])
  end

  def municipe_params
    params.require(:municipe)
          .permit(
            :name,
            :cpf,
            :cns,
            :email,
            :email_confirmation,
            :birth_date,
            :phone,
            :avatar,
            endereco_attributes: %i[
              id cep logradouro complemento bairro cidade uf ibge_code
            ]
          )
  end
end
