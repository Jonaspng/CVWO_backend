class CategoriesController < ApplicationController
  before_action :require_user
  before_action :require_same_user, only: [:destroy]

  def create
    @category = current_user.categories.find_by(category: params[:category])
    if @category
      $error = 'category already exist'
    else
      @category = Category.new(category: params.require(:category))
      @category.user = current_user
      @category.save
    end
  end

  def index
    categories = current_user.categories.order(:id)
    render json: {"categories": categories}
  end

  def destroy
    @category.destroy
  end

  def require_same_user
    @category = Category.find(params[:id])
    if current_user != @category.user
      redirect_to 'https://cvwo-todolist.vercel.app/dashboard'
    end
  end
end
