# frozen_string_literal: true

module Api
  module V1
    class AuthenticationController < ApiController
      skip_before_action :authenticate_request

      # POST /api/v1/auth/login
      def login
        @user = User.find_by(email: params[:email])

        unless @user&.authenticate(params[:password])
          render(json: { error: 'unauthorized' },
                 status: :unauthorized) and return
        end

        token = jwt_encode(user_id: @user.id)
        render(json: { token: }, status: :ok)
      end
    end
  end
end
