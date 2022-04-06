# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApiController
      skip_before_action :authenticate_request, only: [:create]
      before_action :set_user, only: %i[show destroy]

      def index
        @users = User.all
        render(json: @users, status: :ok)
      end

      def show
        render(json: @user, status: :ok)
      end

      def create
        @user = User.new(user_params)

        render(json: @user, status: :created) and return if @user.save

        render(json: { errors: @user.errors.full_messages },
               status: :unprocessable_entity)
      end

      def update
        return if @user.update(user_params)

        render(json: { errors: @user.errors.full_messages },
               status: :unprocessable_entity)
      end

      def destroy
        @user.destroy
      end

      private def user_params
        params.permit(:name, :username, :email, :password)
      end

      private def set_user
        @user = User.find(params[:id])
      end
    end
  end
end
