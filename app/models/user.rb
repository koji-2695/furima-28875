class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
  validates :first_name
  validates :family_name
  end

  with_options presence: true, format: { with: /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/, message: '全角カタカナを使用してください' } do
  validates :first_name_kana
  validates :family_name_kana
  end
  


  validates :birthday, presence: true

  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }

end
