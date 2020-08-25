class Purchase

  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :area_id, :city, :address, :building, :tel #, :item_purchase_id

  VALID_POSTALCODE_REGEX = /\A\d{3}[-]\d{4}\z/

  with_options presence: true do
    validates :postal_code, length: { maximum: 8 }, format: {with: VALID_POSTALCODE_REGEX}
    validates :area_id, numericality: { only_integer: true }
    validates :city
    validates :address
    validates :tel, numericality: { only_integer: true }, length: { maximum: 11 }
  end
  
  def save
    item_purchase = ItemPurchase.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, area_id: area_id, city: city, address: address, building: building, tel: tel, item_purchase_id: item_purchase.id)
  end

end

