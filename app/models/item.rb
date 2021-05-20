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


  validates :item_name ,:discription ,:category_id ,:status_id ,
            :delivery_change_id ,:delivery_time_id ,:prefecture_id ,
            :price ,presence: true

  validates :category_id ,:status_id ,
            :delivery_change_id ,:delivery_time_id ,:prefecture_id ,
            numericality: { other_than: 1 }

end
