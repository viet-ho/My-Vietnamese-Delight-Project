class LineItem < ApplicationRecord
  belongs_to :menu_item
  belongs_to :cart, optional: true
  belongs_to :order, optional: true


  def total_price
    self.quantity * self.menu_item.price
  end
end
