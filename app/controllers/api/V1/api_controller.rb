# frozen_string_literal: true

module Api
  module V1
    class ApiController < ActionController::API
      include JsonWebToken

      before_action :authenticate_request

      # Refactor to a class service
      private def authenticate_request
        header = request.headers['Authorization']
        header = header.split.last if header
        begin
          decoded = jwt_decode(header)
          @current_user = User.find(decoded[:user_id])
        rescue Mongoid::Errors::DocumentNotFound, JWT::DecodeError => error
          render(json: { errors: error.message }, status: :unauthorized)
        end
      end
    end
  end
end
