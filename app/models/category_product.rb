class CategoryProduct < ApplicationRecord
  belongs_to :product
  belongs_to :category
  validates_uniquness_of :category_id, scope: :product_id
end
