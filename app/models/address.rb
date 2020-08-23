class Address < ApplicationRecord

  belongs_to :item_purchases

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area


  with_option presence: true do
  varidates :postal_code, length: { maximum: 8 }, format: {with: /\A\d{3}[-]\d{4}\z/}
  varidates :area_id ,inclusion: { in: 1..47 }
  varidates :city, :address
  varidates :tel, numericality: true, length: { maximum: 11 }, #/\A[0-9]+\z/
  end

end
