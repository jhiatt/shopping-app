class ProductsController < ApplicationController

def products_method
  @products = Product.all
  render "products_view.html.erb"
end

end
