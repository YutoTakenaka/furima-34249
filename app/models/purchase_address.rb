class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :tel, :purchase_id, :user_id, :item_id 

  with_options presence: true do
    validates :postal_code 
    validates :prefecture_id
    validates :city
    validates :address
    validates :tel,format: {with: ^0\d{9,10}$ }
  end

 
  
end