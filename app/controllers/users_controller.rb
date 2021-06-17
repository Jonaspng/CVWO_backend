class UsersController < ApplicationController
  before_action :set_user, only: [:update]
  before_action :require_user, only: [:index, :update]
  before_action :require_same_user, only: [:update]

  $are_there_errors = false
  $successful_registration = false
  $successful_update = false

  def index
    @user = current_user
    render json: {'user': @user}
  end

  def create
    @user = User.new(params.require(:user).permit(:email, :username, :password))
    @user.save
    if @user.errors.any?
      redirect_to 'https://todolist-cvwo.herokuapp.com/register'
      $error = @user.errors.full_messages
      $are_there_errors = true
    else
      session[:user_id] = @user.id
      redirect_to 'https://todolist-cvwo.herokuapp.com/dashboard'
      $successful_registration = true
    end
  end

  def update
    @user.update(params.require(:user).permit(:email, :username, :password))
    if @user.errors.any?
      $error = @user.errors.full_messages
      $are_there_errors = true
    else
      $successful_update = true
    end
  end

  def create_error
    if $are_there_errors
      render json: { "error": $error }
      $are_there_errors = false
    else
      render json:{ "error":[] }
    end
  end

  def create_success
    if $successful_update
      render json: {"success": ['Details updated sucessfully']}
      $successful_update = false
    end
  end

  def require_same_user
    if current_user != @user
      redirect_to 'https://todolist-cvwo.herokuapp.com/dashboard'
    end
  end

  def set_user
    @user = User.find(params[:id])
  end
end
