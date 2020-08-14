class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  VALID_NAMEREADING_REGEX = /\A[ァ-ヶー－]+\z/
  

  has_many :items
  has_many :comments
  has_many :item_purchases

  # 入力必須項目の設定 PW英数混合のバリデーション設定
  validates :last_name, :first_name, :birthday, :nickname, :email, :encrypted_password, presence:true
  validates :password, presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }
  validates :last_name_reading, :first_name_reading, format: {with: VALID_NAMEREADING_REGEX}
end
