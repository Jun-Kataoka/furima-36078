class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number

  with_options presence: true do
    validates :user_id, :item_id, :token, :city, :house_number
    validates :postal_code,
              format: { with: /\A[0-9]{3}-[0-9]{4}\z/, allow_blank: true,
                        message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :telephone_number, numericality: { allow_blank: true, message: 'is invalid. Input only number' },
                                 length: { in: 10..11, allow_blank: true, message: 'is too short' }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number,
                   building_name: building_name, telephone_number: telephone_number, order_id: order.id)
  end
end
