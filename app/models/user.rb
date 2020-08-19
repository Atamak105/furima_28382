class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  VALID_NAMEREADING_REGEX = /\A[ァ-ヶー－]+\z/
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/

  has_many :items
  has_one :item_purchases

  # 入力必須項目の設定 バリデーション設定
  validates :birthday, :nickname, :email, :encrypted_password, presence:true
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }
  validates :last_name_reading, :first_name_reading, format: {with: VALID_NAMEREADING_REGEX}
  validates :last_name, :first_name, format: {with: VALID_NAME_REGEX}
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
end
