class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :tel, :purchase_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :address
    validates :tel, format: { with: /\A\d{10,11}\z/, message: "is invalid. Can't include hyphen(-)" }
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)

    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address,
                           building: building, tel: tel, purchase_id: purchase.id)
  end
end
