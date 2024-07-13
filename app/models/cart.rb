class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  
  def total_price
    line_items.sum(&:total_price)
  end
end
