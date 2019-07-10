class PasswordsController < ApplicationController
#sends password email
  def forgot
    if params[:email].blank?
      return render json: {error: 'Email not present'}
    end

    user = User.find_by(email: params[:email] + '.com')

    if user.present?
      user.generate_password_token!
      token = user[:reset_password_token]
      ResetPasswordMailer.reset_password_email(params[:email], token).deliver_now
      render json: {
        status: 200,
        message: "An email has been sent to #{params[:email]}, please follow the link to reset your password"
      }
    else
      render json: {error: ['Email address not found. Please check
        and try again.']}, status: :not_found
    end
  end
#reset password
  def reset
    token = params[:token].to_s
    password = params[:password].to_s

    user = User.find_by(reset_password_token: token)

    if user.present? && user.password_token_valid?
      if user.reset_password!(password)
        render json: {message: 'password successfully reset'}, status: :ok
      else
        render json: {error: user.errors.full_messages}, status: :unprocessable_entity
      end
    else render json: {error: ['Link not valid or expired. Try generating a new link.']}, status: :not_found
    end
  end
#updates password
  def update
    if !params[:password].present?
      render json: {error: 'Password not present'}, status: :unprocessable_entity
      return
    end

    if current_user.reset_password(params[:password])
      render json: {status: 'ok'}, status: :ok
    else
      render json: {errors: current_user.errors.full_messages}, status: :unprocessable_entity
    end
  end

#
end
