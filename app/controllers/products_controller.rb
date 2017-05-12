class ProductsController < ApplicationController

def index
  @products = Product.all
  render "index.html.erb"
end

def new
  render "new.html.erb"
end

def create
  @new_product = Product.create(name: params[:name_param], price: params[:price_param], image: params[:image_param], description: params[:description_param])
  render "create.html.erb"  
end

def show
  @product = Product.find_by(id: params[:id])
  render "show.html.erb"
end

def edit
  @product = Product.find_by(id: params[:id])
  render "edit.html.erb"
end

def update
  @product = Product.find_by(id: params[:id])
  @product.update(name: params[:name_param], price: params[:price_param], image: params[:image_param], description: params[:description])
  render "update.html.erb"
end

end