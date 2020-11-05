class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :explanation, presence: true
  validates :condition, presence: true
  validates :information, presence: true
  validates :price, presence: true
  validates :area, presence: true
  validates :days, presence: true
  validates :fee, presence: true

  /\A[0-9]+\z/
  
end
