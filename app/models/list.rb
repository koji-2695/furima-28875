class List < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_date
  belongs_to :shipping_fee

  

  validates :price, numericality: { with: /\A[0-9]+\z/, message: '半角数字を入力してください' }

  validates_inclusion_of :price, in: 300..9_999_999
  
  with_options presence: true do
    validates :price
    validates :item_name
    validates :explanation
    validates :image
   
    with_options numericality: { other_than: 0 , only_integer: true} do
      validates :category_id
      validates :condition_id
      validates :shipping_fee_id
      validates :area_id
      validates :shipping_date_id
    end
  end



end
