FactoryBot.define do
  factory :purchase do
    postal_code { "123-4567" }
    area_id { 30 }
    city { "港区" }
    address { "青山1-1-1" }
    building { "青山タワー503" }
    tel { "09012345678" }
  end
end
