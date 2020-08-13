class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :comments
  has_many :item_purchases

  # 入力必須項目の設定
  validates :last_name, :first_name, :last_name_reading, :first_name_reading, :birthday, :nickname, :email, :encrypted_password, presence:true

end
