class ProductsController < ApplicationController

def index
  @products = Product.all
  render "index.html.erb"
end

def new
  render "new.html.erb"
end

def create
  product = Product.create(name: params[:name_param], price: params[:price_param], image: params[:image_param], description: params[:description_param])
  flash[:success] = "New product created!!  Welcome to the family."
  redirect_to "/products/#{product.id}"  
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
  product = Product.find_by(id: params[:id])
  product.update(name: params[:name_param], price: params[:price_param], image: params[:image_param], description: params[:description])
  flash[:info] = "Product updated"
  redirect_to "/products/#{ product.id}"
end

def destroy
  product = Product.find_by(id: params[:id])
  product.destroy
  flash[:danger] = "YOU DELETED MY PRODUCT!!!....you monster"
  redirect_to "/products"
end


end