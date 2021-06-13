class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id), method: :get
    else
      render :edit
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :price, :delivery_change_id, :delivery_time_id, :status_id,
                                 :prefecture_id, :category_id).merge(user_id: current_user.id)
  end
end

def set_item
  @item = Item.find(params[:id])
end

def move_to_index
  redirect_to action: :index unless current_user.id == @item.user_id
end

