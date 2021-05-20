class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_change

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_time

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status

  with_options presence: true do
    validates :item_name ,length: { maximum: 40 }
    validates :discription,length: { maximum: 1000 }
    validates :category_id
    validates :status_id
    validates :delivery_change_id
    validates :delivery_time_id
    validates :prefecture_id
    validates :price ,numericality: {greater_than_or_equal_to: 300 ,less_than_or_equal_to: 9999999 }
  end


  validates :category_id ,:status_id ,
            :delivery_change_id ,:delivery_time_id ,:prefecture_id ,
            numericality: { other_than: 1 }

end
