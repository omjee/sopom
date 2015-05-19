class MetiersController < ApplicationController
  before_action :set_metier, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @metiers = Metier.all
    respond_with(@metiers)
  end

  def show
    respond_with(@metier)
  end

  def new
    @metier = Metier.new
    respond_with(@metier)
  end

  def edit
  end

  def create
    @metier = Metier.new(metier_params)
    @metier.save
    respond_with(@metier)
  end

  def update
    @metier.update(metier_params)
    respond_with(@metier)
  end

  def destroy
    @metier.destroy
    respond_with(@metier)
  end

  private
    def set_metier
      @metier = Metier.find(params[:id])
    end

    def metier_params
      params.require(:metier).permit(:name)
    end
end
