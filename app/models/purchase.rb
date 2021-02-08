class Purchase < ApplicationRecord

  has_one :address
  has_one :list
end
