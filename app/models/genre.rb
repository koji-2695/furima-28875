class Genre < ApplicationRecord
  self.data = [
    { id: 1, name: 'lister' },
    { id: 2, name: 'category' },
    { id: 3, name: 'condition' },
    { id: 4, name: 'shipping_fee' },
    { id: 5, name: 'area' },
    { id: 6, name: 'shipping_date' }
  ]

  belongs_to_active_hash

end

