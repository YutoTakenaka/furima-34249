class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :tel, :purchase_id, :user_id, :item_id 

  with_options presence: true do
    validates :postal_code ,format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :tel ,format: {with: /^[0-9]+$/, message: "is invalid. Can't include hyphen(-)"} ,length: {maximum: 11, minimum: 10 }
    validates :user_id
    validates :purchase_id
    validates :item_id
  end
  
  validates :prefecture_id,numericality: {other_than: 0, message: "can't be blank"}
 
  def save
    purchase = Purchase.create(item_id:item_id, user_id: user_id)
      
      Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, tel: tel, user_id: user.id, item_id: item.id, purchase_id: purchase.id)
  end

end