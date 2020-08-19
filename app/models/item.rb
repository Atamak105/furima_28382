class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charges
  belongs_to_active_hash :area
  belongs_to_active_hash :delivery
  has_one_attached :image
  belongs_to :user
  has_one :item_purchases

  with_option presence: true do
    validates :image
    validates :category_id, :status_id, :shipping_charges_id, :area_id, :delivery_id, inclusion: { in: 1..47 }
    validates :name, length: { maximum: 40 }
    validates :explanation, length: { maximum: 1000 }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than: 9999999 }
  end
  
end