class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:follow, :unfollow]
  def index
    if params[:q]
      users = User.where("email ILIKE ?", "%#{params[:q]}%")
    else
      users = User
    end
    users = users.page(params[:page]).per(params[:size])
    render json: users, include: params[:include]
  end

  def follow
    user = User.find(params[:user_id])
    current_user.follow(user)
  end

  def unfollow
    user = User.find(params[:user_id])
    current_user.stop_following(user)
  end

  def show
    user = User.find(params[:id])
    render json: @user, include: params[:include]
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
