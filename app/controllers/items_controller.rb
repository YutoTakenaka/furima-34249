class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    
  end
  
  private

  def item_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end
end
