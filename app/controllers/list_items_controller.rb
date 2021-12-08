class ListItemsController < ApplicationController
  before_action :set_item, only: [:destroy, :update]
  before_action :require_user
  before_action :require_same_user, only: [:destroy, :update]
  $filter = false

  def create
    @item = ListItem.new(params.require(:item).permit(:title, :description, :deadline))
    @item.user = current_user
    @item.category = Category.find(params[:category_id].to_i)
    @item.save
  end

  def index
    if $filter
      items = current_user.listItems.where(category: $category).order(:id)
    else
      items = current_user.listItems.order(:id)
    end
    render json: { "items": items }
  end

  def destroy
    @item.destroy
  end

  def update
    @item.update(params.require(:item).permit(:title, :description, :category, :deadline))
  end

  def require_same_user
    if current_user != @item.user
      redirect_to 'https://todolist-cvwo.herokuapp.com/dashboard'
    end
  end

  def filter
    $filter = true
    $category = params.require(:filterValue)
  end

  def show_all
    $filter = false
  end

  private

  def set_item
    @item = ListItem.find(params[:id])
    puts @item
  end
end
