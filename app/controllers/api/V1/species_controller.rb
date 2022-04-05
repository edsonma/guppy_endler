# frozen_string_literal: true

module Api
  module V1
    class SpeciesController < ApiController
      before_action :set_specie, only: %i[show]

      def index
        @species = Specie.all
        render(json: @species)
      end

      def show
        if @specie.blank?
          render(json: { errors: 'not found' },
                 status: :not_found) and return
        end

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
