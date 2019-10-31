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
    @city = City.new(name: params[:city])
    #if @city
    @user = Gossip.new(first_name: params[:first_name], last_name: params[:last_name], age: params[:age], email: params[:email], descrption: params[:description], city: @city ,password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      flash[:success] = "Well done, your account has been created successfully !"
      redirect_to gossips_path
    elsif
      flash.now[:error] = true
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
