class SessionsController < ApplicationController
  def new
  end

  def create
  	# Find user based on email address
  	@user = User.find_by(email: params[:session][:email].downcase)
  	# Compare hash of the password submitted in the params
  	# to the hased password stored in the database
  	if @user && @user.authenticate(params[:session][:password])
  		flash[:success] = "You have successfully signed in!"
  		sign_in @user
  		params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
  		redirect_to @user
  	else
  		flash.now[:danger] = 'Invalid email and/or password'
  		render 'new'
  	end
  end

  def destroy
  	sign_out if signed_in?
  	flash[:success] = "You have successfully logged out"
  	redirect_to root_url
  end
end
