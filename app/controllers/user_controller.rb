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
    @city = City.find_by(name: params[:city])
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], age: params[:age], email: params[:email], description: params[:description], city: @city ,password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      flash[:success] = "Well done, your account has been created successfully !"
      log_in(@user)
      redirect_to gossips_path
    elsif
      flash.now[:error] = true
      render :new
    end
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    @city = City.find_by(name: params[:city])
    if @user.update(first_name: params[:first_name], last_name: params[:last_name], age: params[:age], email: params[:email], description: params[:description], city: @city)
      flash[:success] = "Well done, your profile has been updated successfully !"
      redirect_to gossips_path
    elsif
      flash.now[:error] = true
      render :edit
    end
  end

  def destroy

  end

end
