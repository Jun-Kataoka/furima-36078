class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :period
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :caption, length: { maximum: 1000 }
    validates :price, numericality: { greater_than_or_equal_to: 300,
                                      less_than_or_equal_to: 9_999_999,
                                      allow_blank: true,
                                      message: 'is invalid. Input  range of 300 to 9999999 numeric characters.' }
  end
  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :fee_id
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :period_id
  end
end
