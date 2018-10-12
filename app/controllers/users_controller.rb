class UsersController < ApplicationRecord
  before_action :authenticate_user, except: [:show, :create]

  def show
    user = User.find params[:id]
    render json: user
  end

  def create
    user = User.new(user_params)
    if user.save
      token = Knock::AuthToken.new(payload: { sub: user.id }).token
      payload = {
        user: user,
        jwt: token
      }
      render json: payload, status: 201
    else
      render json: {errors: user.errors}, status: 422
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :address, :phone_number, :password, :password_confirmation)
  end
end
