FactoryBot.define do
  factory :list do

    association :user 

    price           {50000}
    item_name        {"おもちゃ"}
    explanation        {"おもしろい"}
    category_id        {1}
    condition_id       {1}
    shipping_fee_id      {1}
    area_id             {1}
    shipping_date_id      {1}
    
    after(:build) do |list|
      list.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    
  end
end
