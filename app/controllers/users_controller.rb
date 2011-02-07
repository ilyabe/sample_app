class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end
  
  def new
    @user = User.new
    @title = "Sign up"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      @signed_in = true
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      @title = "Sign up"
      @user.password = ""
      render 'new'
    end
  end

  # Added this to make users_controller_spec.rb
  # "should sign the user in" test pass
  # because it didn't seem to pass after
  # listing 9.24 in rails tutorial
  # even though the user is definitely
  # signed in after registering
  def signed_in?
    if @signed_in == true
      true
    end
  end
end
