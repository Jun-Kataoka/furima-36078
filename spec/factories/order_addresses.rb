FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '札幌市中央区' }
    house_number { '北３条西６丁目' }
    building_name { '北海道庁' }
    telephone_number { '0112314111' }
    token { 'tok_727a531ca6130bb0537ea800b628' }
  end
end