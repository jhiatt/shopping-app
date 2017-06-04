# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create(name: "Cool")
Category.create(name: "Awesome")
Category.create(name: "Inspiring")
Category.create(name: "Reflective")

Product.all.each do |product|
  CategoryProduct.create(product_id: product.id, category_id: Category.pluck(:id).sample)
  CategoryProduct.create(product_id: product.id, category_id: Category.pluck(:id).sample)
end