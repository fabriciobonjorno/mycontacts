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

      def confirm
        user = User.find_by(confirmation_token: params[:token])
        if user
          user.confirmed = true
          user.confirmation_token = nil
          user.save
          render json: 'Usuário confirmado com sucesso!', status: :ok
        else
          render json: 'Não podemos confirmar seu e-mail!', status: :unprocessable_entity
        end
      end

      def reset_password
        user = User.find_by(email: params[:email])
        if user.present?
          user.generate_reset_password
          Thread.new { SendResetPasswordMailer.send_reset_password_token(user).deliver }
          render json: 'Senha resetada com sucesso', status: :ok
        else
          render json: 'Conta não localizada', status: :unprocessable_entity
        end
      end

      def update_password
        return render json: 'Senha deve ser informada', status: :unprocessable_entity if params[:password].blank?

        user = User.find_by(password_reset_token: params[:token])

        if user
          if user.update(password: params[:password], password_reset_token: nil)
            render json: 'Senha atualizada com sucesso', status: :ok
          else
            render json: user.errors.full_messages, status: :unprocessable_entity
          end
        else
          render json: 'Conta não localizada', status: :unprocessable_entity
        end
      end
    end
  end
end
