class List < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :item_name, presence: true

  validates :explanation, presence: true

  validates :image, presence: true

  validates_inclusion_of :price, in: 300..9_999_999
  
  with_options presence: true, numericality: { only_integer: true } do
  validates :price


  validates :category_id

  validates :condition_id

  validates :shipping_fee_id

  validates :area_id

  validates :shipping_date_id

  end

  with_options numericality: { other_than: 0 } do
   
    
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :area_id
    validates :shipping_date_id

  end



end
