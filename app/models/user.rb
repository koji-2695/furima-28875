class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  with_options presence: true, format: { with: /\A[一-龥ぁ-ん]/, message: '全角文字を使用してください' } do
  validates :first_name
  validates :last_name
  end

  with_options presence: true, format: { with: /[\p{katakana}ー－&&[^ -~｡-ﾟ]]+/, message: '全角カタカナを使用してください' } do
  validates :first_name_kana
  validates :last_name_kana
  end
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


  validates :birthday, presence: true

  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }

end
