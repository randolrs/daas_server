class API::V1::UsersController < ApplicationController
  def index
    @users = User.all
    if @users
      render json: {
        users: @users
      }
    else
      render json: {
        status: 500,
        errors: ['no users found']
      }
    end
  end

  def show
    @user = User.find(params[:id])
    if @user
      render json: {
        user: @user
      }
    else
      render json: {
        status: 500,
        errors: ['user not found']
      }
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!
      render json: {
        status: :created,
        user: @user
      }
    else
      render json: {
        status: 500,
        errors: @user.errors.full_messages
      }
    end
  end

  def update
    @user = User.find(params[:id])
    if @user
      if @user.authenticate(user_params[:password])
        if @user.update(user_params)
          render json: {
            status: :updated,
            user: @user
          }
        else
          render json: {
            status: 500,
            user: @user.errors.full_messages
          }
        end
      else
        render json: {
          status: 500,
          errors: ['Please provide your current password']
        }
      end
    else
      render json: {
        status: 500,
        errors: ['user not found']
      }
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
