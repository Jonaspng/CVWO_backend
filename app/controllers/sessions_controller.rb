class SessionsController < ApplicationController
  before_action :require_user, except: [:create, :validation,:persist]

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params.require(:password))
      session[:user_id] = user.id
      redirect_to 'https://todolist-cvwo.herokuapp.com/dashboard'
    else
      redirect_to 'https://todolist-cvwo.herokuapp.com/login'
      $error = true
    end
  end

  def persist
    if logged_in?
      render json: { "auth": true }
    else
      render json: { "auth": false }
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to 'https://todolist-cvwo.herokuapp.com'
  end

  def validation
    if $error
      render json: { "error": ['Incorrect email or password'] }
      $error = false
    else
      render json: { "error": [] }
    end
  end

  def chart
    data = []
    categories = current_user.categories
    category = current_user.listItems.where(category_id: 0)
    if category == nil
      data.append(0)
    else
      data.append(category.length)
    end
    for x in categories
      category = current_user.listItems.where(category_id: Interger(x.id))
      if category == nil
        data.append(0)
      else
        data.append(category.length)
      end
    end
    render json: { "data": data }
  end

  def show_username
    username = current_user.username
    render json: { "username": username }
  end
end
