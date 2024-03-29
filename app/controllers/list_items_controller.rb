class ListItemsController < ApplicationController
  before_action :set_item, only: [:destroy, :update]
  before_action :require_user
  before_action :require_same_user, only: [:destroy, :update]

  def create
    @item = ListItem.new(params.require(:item).permit(:title, :description, :deadline, :category_id))
    @item.user = current_user
    @item.save
  end

  def index
    items = current_user.listItems.order(:id)
    render json: {"items": items}
  end

  def destroy
    @item.destroy
  end

  def update
    @item.update(params.require(:item).permit(:title, :description, :deadline, :category_id))
  end

  def require_same_user
    if current_user != @item.user
      redirect_to 'https://cvwo-todolist.vercel.app/dashboard'
    end
  end

  private

  def set_item
    @item = ListItem.find(params[:id])
    puts @item
  end
end
