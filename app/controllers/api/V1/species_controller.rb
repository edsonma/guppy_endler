# frozen_string_literal: true

module Api
  module V1
    class SpeciesController < ActionController::API
      before_action :set_specie, only: %i[show]

      def index
        @species = Specie.all
        render(json: @species)
      end

      def show
        render(json: @specie)
      end

      private def set_specie
        @specie = Specie.find(params[:id])
      end

      private def specie_params
        params.require(:specie).permite(:name)
      end
    end
  end
end
