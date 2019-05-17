class UsersController < ApplicationController
  before_action :authenticate_user, except: [:show, :create, :user_by_email, :update_user_cart]

  def show
    user = User.find params[:id]
    render json: user
  end

  def create
    user = User.new(user_params)
    if user.save
      UserMailer.with(user: user).welcome_email.deliver_now
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

  def user_by_email
      email = params[:email]
      @user = User.where(email: email + ".com")
      render json: @user, status: 200
  end

  def update_user_cart
    @id = params[:id]
    @cart_id = params[:cart_id]
    @user = User.find(@id)
    if @user.update_attribute(:cart_id, "#{@cart_id}")
      render json: @user, status: 200
    else
      render json: {errors: @user.errors}, status: 422
    end
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
  end

  private
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :address, :phone_number, :password, :password_confirmation, :cart_id)
  end
end
