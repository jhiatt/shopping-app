class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images

  def sale_message
    #if self.price
    if price < 20
      "Discount Item!!"
    else
      "Everyday Value!"
    end
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

end

