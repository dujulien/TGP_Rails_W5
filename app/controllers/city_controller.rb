class CityController < ApplicationController

  def index
  end

  def show
    @city = City.find(params[:id].to_i)
    @all_users = @city.users
    puts "$"*10
    puts @city
    puts @all_users
    puts "$"*10
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
