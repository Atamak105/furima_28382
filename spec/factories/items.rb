FactoryBot.define do

  factory :item do
    association :user
    name { "ココナッツ" }
    explanation { "ココナッツの置物です" }
    category_id { 1 }
    status_id { 1 }
    shipping_charges_id { 1 }
    area_id { 47 }
    delivery_id { 2 }
    price { 9000 }
  end

  
end




