FactoryBot.define do
  factory :user do
    nickname { 'taro' }
    email    {Faker::Internet.free_email}
    password { 'test1234' }
    password_confirmation { password }
    family_name { '鈴木' }
    first_name { '太郎' }
    family_name_reading { 'スズキ' }
    first_name_reading { 'タロウ' }
    birthday { '1930-01-01' }
  end
end
