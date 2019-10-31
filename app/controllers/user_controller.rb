class UserController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id].to_i)
    @cityid = @user.city.id
  end

  def new
  end
  
  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
