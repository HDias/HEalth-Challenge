class MunicipesController < ApplicationController
  before_action :set_municipe, only: %i[edit update]

  def index
    @municipes = Municipe.includes(:endereco).page params[:page]
  end

  def new
    @municipe = Municipe.new
    @municipe.build_endereco
  end

  def edit; end

  def create
    creator = CreateMunicipe.new(params: municipe_params)

    respond_to do |format|
      if creator.submit
        format.html { redirect_to municipes_url, notice: 'Munícipe criado com sucesso' }
      else
        @municipe = creator.municipe
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    updater = UpdateMunicipe.new(params: municipe_params, municipe: @municipe)

    respond_to do |format|
      if updater.submit
        format.html { redirect_to municipe_url(@municipe), notice: 'Munícipe atualizado com sucesso.' }
      else
        @municipe = updater.municipe
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
            :status,
            :avatar,
            endereco_attributes: %i[
              id cep logradouro complemento bairro cidade uf ibge_code
            ]
          )
  end
end
