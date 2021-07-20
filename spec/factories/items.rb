FactoryBot.define do
  factory :item do
    name { 'テスト商品' }
    caption { 'テスト商品の説明' }
    category_id { 2 }
    condition_id { 2 }
    fee_id { 2 }
    prefecture_id { 2 }
    period_id { 2 }
    price { 2000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
