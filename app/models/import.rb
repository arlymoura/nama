class Import < ApplicationRecord

  def total_price
    unit_price*quantity
  end
end
