class List < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions




  
  with_options presence: true, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' } do
  validates :price, length: { in: 300..9999999 }

  validates :item_name, presence: true

  validates :explanation, presence: true

  validates :lister_id, presence: true

  validates :category_id, presence: true

  validates :condition_id, presence: true

  validates :shipping_fee_id, presence: true

  validates :area_id, presence: true

  validates :shipping_date_id, presence: true

  end

  with_options numericality: { other_than: 1 } do
   
    validates :item_name
    validates :explanation
    validates :lister_id
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :area_id
    validates :shipping_date_id

  end



end
