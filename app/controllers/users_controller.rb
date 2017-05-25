class UsersController < ApplicationController
  def new
    render "new.html.erb"
  end

  def create
    user = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if user.save
      flash[:success] = "Welcome home, your account has been created!"
      redirect_to "/"
    else 
      flash[:error] = "Invalid user name or password"
      redirect_to "/signup"
  end
    
  end
end
