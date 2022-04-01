class SpeciesController < ApplicationController
  before_action :set_specie, only: [:show, :update, :destroy]

  def index
    @species = Specie.all
  end

  def show
    render @specie
  end

  private def set_specie
    @specie = Specie.find(params[:id])
  end

  private def specie_params
    params.require(:specie).permite(:name)
  end
end
  