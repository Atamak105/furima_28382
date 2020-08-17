class Item < ApplicationRecord

  belongs_to :user
  has_many :item_purchases
  has_many :comments
  
end
