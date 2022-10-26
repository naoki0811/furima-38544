FactoryBot.define do
  factory :item do
    product_name         {'テスト'}
    description          {Faker::Lorem.sentence}
    category_id          {1}
    situation_id         {1}
    shopping_cost_id     {1}
    prefecture_id        {1}
    shipping_id          {1}
    price                {9999}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
