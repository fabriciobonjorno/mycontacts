# frozen_string_literal: true

module Api
  module V1
    class RegisterController < ApplicationController
      def create
        user = User.new
        user.name = params[:name]
        user.email = params[:email]
        user.password = params[:password]
        if user.save
          user.generate_confirmation_token
          Thread.new { SendConfirmationMailer.send_confirmation_token(user).deliver }
          render json: 'Usuário cadastrado com sucesso!', status: :ok
        else
          render json: user.errors.full_messages, status: :unprocessable_entity
        end
      end
    end
  end
end
