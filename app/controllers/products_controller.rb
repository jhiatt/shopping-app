class ProductsController < ApplicationController

def index
  @products = Product.all

  if params[:sort]
    @products = Product.order(params[:sort])

  elsif params[:sort_desc]
    @products = Product.order(params[:sort_desc] => :desc)

  elsif params[:discount]
    @products = Product.where("price < ?", 20)

  end


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
  if params[:id] == "rand"
      @product = Product.all.sample
  else

    @product = Product.find_by(id: params[:id])
    render "show.html.erb"
  end
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

def search
  @products = Product.where("name ILIKE?", "%#{params[:search]}%")
  render "index.html.erb"
end

end