class ProductsController < ApplicationController
before_action :authenticate_admin!, except: [:index, :show]

def index
  if session[:counter]
    session[:counter] += 1
  else
    session[:counter] = 1
  end

  @counter = session[:counter]

  @products = Product.all

  if params[:sort]
    @products = Product.order(params[:sort])

  elsif params[:sort_desc]
    @products = Product.order(params[:sort_desc] => :desc)

  elsif params[:discount]
    @products = Product.where("price < ?", 20)
  elsif params[:category]
    category = Category.find_by(name: params[:category])
    @products = category.products
  end
  render "index.html.erb"
end

def new
  @product = Product.new
  @suppliers = Supplier.all
  render "new.html.erb"
end

def create
    @product = Product.new(
      name: params[:name_param], 
      price: params[:price_param], 
      description: params[:description_param], 
      supplier_id: params[:supplier]
      )
    if @product.save 
      image = Image.new(
        url: params[:image_param], 
        product_id: @product.id
        )
      if image.save
      flash[:success] = "New product created!!  Welcome to the family."
      redirect_to "/products/#{@product.id}"  
    else
      flash[:error] = "Please correct the following errors:"
      flash[:error] = "#{@product.errors.full_messages.join(", ")}" if @product.errors.any?
      flash[:error] += ", #{image.errors.full_messages.join(", ")}" if image.errors.any? && @product.errors.any?
      flash[:error] += "#{image.errors.full_messages.join(", ")}"
      render "new.html.erb"
    end
  end
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
    @product = Product.find_by(id: params[:id])
    @product.assign_attributes(name: params[:name_param], price: params[:price_param], description: params[:description_param])
    @image = Image.new(url: params[:image_param], product_id: params[:id])
    if @product.save && @image.save
      flash[:info] = "Product updated"
      redirect_to "/products/#{@product.id}"
    else
      flash[:error] = "Please correct the following errors: "
      flash[:error] = "#{@product.errors.full_messages.join(", ")}" if @product.errors.any?
      flash[:error] += ", #{@image.errors.full_messages.join(", ")}" if @image.errors.any? && @product.errors.any?
      flash[:error] += "#{@image.errors.full_messages.join(", ")}"
      render "edit.html.erb"
    end
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