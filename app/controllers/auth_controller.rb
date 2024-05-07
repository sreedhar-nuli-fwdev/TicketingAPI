class AuthController < ApplicationController

  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      token = JsonWebToken.encode(email: user.email)
      render json: { status: 'success', token: token, user: user }
    else
      render json: { status: 'error', error: 'Invalid email or password' }, status: :unauthorized
    end
  end
end
