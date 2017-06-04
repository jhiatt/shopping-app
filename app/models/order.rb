class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :quantity, :tax, :total, :subtotal, numericality: true
  validates :quantity, presence: true
  
end
