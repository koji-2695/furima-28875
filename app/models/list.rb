class List < ApplicationRecord

  
  with_options presence: true, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' } do
  validates :price, length: { in: 300..9999999 }

  validates :item_name, presence: true

  validates :explanation, presence: true

  validates :lister, presence: true

  validates :category, presence: true

  validates :condition, presence: true

  validates :shipping_fee, presence: true

  validates :area, presence: true

  validates :shipping_date, presence: true


end
