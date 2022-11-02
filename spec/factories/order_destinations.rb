FactoryBot.define do
  factory :order_destination do
    post_code { '123-4567' }
    prefecture_id { 1 }
    city { '新宿区' }
    address { '1-1' }
    build { '任意' }
    phone_number { '19012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end

