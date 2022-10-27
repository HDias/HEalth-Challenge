class MunicipesController < ApplicationController
  before_action :set_municipe, only: %i[show edit update destroy]

  def index
    @municipes = Municipe.all
  end

  def show; end

  def new
    @municipe = Municipe.new
  end

  def edit; end

  def create
    @municipe = Municipe.new(municipe_params)

    respond_to do |format|
      if @municipe.save
        format.html { redirect_to municipe_url(@municipe), notice: 'Municipe was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @municipe.update(municipe_params)
        format.html { redirect_to municipe_url(@municipe), notice: 'Municipe was successfully updated.' }
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
    params.require(:municipe).permit(:name, :cpf, :cns, :email, :birth_date, :phone,:avatar)
  end
end
