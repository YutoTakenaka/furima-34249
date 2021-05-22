require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do

    context '商品出品ができる場合' do

      it '必須項目が入力されていれば出品できる' do
        
      end

    end
    
    context '商品出品ができない場合' do
      
      it 'imageが空では出品できない' do
        
      end

      it 'item_nameが空では出品できない' do
        
      end
     
      it 'descriptionが空では出品できない' do
        
      end
     
      it 'category_idが１だと出品できない' do
        
      end

      it 'status_idが１だと出品できない' do
        
      end

      it 'delivery_change_idが１だと出品できない' do
        
      end

      it 'prefecture_idが１だと出品できない' do
        
      end

      it 'delivery_time_idが１だと出品できない' do
        
      end

      it 'priceが300未満では出品できない' do
        
      end

      it 'priceが9999999より大きいと出品できない' do
        
      end
      
      it 'priceが空では出品できない' do
        
      end

    end

  end
end
