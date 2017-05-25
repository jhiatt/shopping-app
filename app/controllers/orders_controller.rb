class OrdersController < ApplicationController
  def create
    if current_user
      product = Product.find_by(id: params[:product_id])
      subtotal = params[:quantity].to_i * product.price
      tax = subtotal * 0.09
      total = subtotal + tax
      @order = Order.new(user_id: current_user.id, quantity: params[:quantity], product_id: params[:product_id], subtotal: subtotal, tax: tax, total: total)
      @order.save
      redirect_to "/orders/#{@order.id}"
    else
      flash[:warning] = "Please log in"
      redirect_to "/products/#{params[:product_id]}"
    end
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

end
