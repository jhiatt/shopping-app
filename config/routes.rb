Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/products", to: 'products#products_method'
  get "/new_product", to: 'products#new_product_method'
  get "/product_created", to: 'products#create_product_method'
end
