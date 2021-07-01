require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build( :purchase_address,user_id: @user.id, item_id: @item.id )
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@purchase_address).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @purchase_address.building = nil
        expect(@purchase_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空では保存できない' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンが含まれていないと保存できない' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが0では保存できない' do
        @purchase_address.prefecture_id = 0
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では保存できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では保存できない' do
        @purchase_address.address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'telが空では保存できない' do
        @purchase_address.tel = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tel can't be blank")
      end
      it 'telが10桁未満では保存できない' do
        @purchase_address.tel = '123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tel is invalid. Can't include hyphen(-)")
      end
      it 'telが12桁以上では保存できない' do
        @purchase_address.tel = '123456789012'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tel is invalid. Can't include hyphen(-)")
      end
      it 'telにハイフンが含まれていると保存できない' do
        @purchase_address.tel = '123-4567-890'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tel is invalid. Can't include hyphen(-)")
      end
      it 'itemと結びついていないと保存できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'userと結びついていないと保存できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'tokenが空では保存できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
