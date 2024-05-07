class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @user = User.all
    render json: @user
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)
    #hack for updating password in user object
    @user.password = params[:password]

    if @user.save
      token = JsonWebToken.encode(email: @user.email)
      render json: { status: 'success', token: token }
    else
      render json: @user.password, status: :unprocessable_entity
    end
  end

  #GET /email
  def email
    @user = User.find_by(email: params[:email])
    #puts 'debug',@user
    render json: UserMailer.welcome_email(@user).deliver_now
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:email, :password, :name, :account_type)
  end
end
