# frozen_string_literal: true

class SendResetPasswordMailer < ApplicationMailer
  def send_reset_password_token(user)
    @user = user
    mail(
      from: ENV['EMAIL_DEFAULT'],
      to: @user.email,
      subject: 'Recuperação de senha'
    )
  end
end
