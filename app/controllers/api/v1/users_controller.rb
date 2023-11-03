class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: %i[login register]

  # GET /api/v1/users/:id
  def show
    @user = User.find(params[:id])
    render json: @user, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
