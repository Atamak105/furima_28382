FactoryBot.define do
  factory :user do
    nickname { "コナン" }
    email { "konan@gmai.com" }
    password { "111qqq" }
    password_confirmation { password }
    first_name { "江戸川" }
    last_name { "コナン" }
    first_name_reading { "エドガワ" }
    last_name_reading { "コナン" }
    birthday { "1989-5-4" }
  end
end
