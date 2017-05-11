class ProductsController < ApplicationController

def products_method
  @products = Product.all
  render "products_view.html.erb"
end

def new_product_method
  render "new_product_view.html.erb"
end

def create_product_method
  @new_product = Product.create(name: params[:name_param], price: params[:price_param], image: params[:image_param], description: params[:description_param])
  render "create_product_view.html.erb"  
end

end
