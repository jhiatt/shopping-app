class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products
  validates :description, :name, presence: true
  validates :price, numericality: {only_integer: true}

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

