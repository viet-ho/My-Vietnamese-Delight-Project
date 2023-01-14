class MenuItem < ApplicationRecord
  # has_many :line_items, dependent: :destroy
  has_many :carts, through: :line_items
end
