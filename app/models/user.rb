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

  validates :email, presence: true, length: { maximum: 255 }
  # ,
  #                   format: { with: VALID_EMAIL_REGEX, message: 'メールアドレスに一意性を持たせてください'},
  #                   uniqueness: true
  


  validates :birthday, presence: true

  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, presence: true,
            format: { with: VALID_PASSWORD_REGEX,
             message: "は半角の英字・数字それぞれ１文字以上含む必要があります"}
  
end
