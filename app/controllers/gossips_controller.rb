class GossipsController < ApplicationController
before_action :authenticate_user, only: [:new, :edit, :update, :destroy, :create]

  # def index_secret
  # 	@user_name = params[:user_name]
  # 	@all_gossips = Gossip.all
  # end

  def index
  	@all_gossips = Gossip.order(:id).all
    @gossip = Gossip.new
  end

  def show
    @gossip = Gossip.find(params[:id].to_i)
  end

  def new
  end
  
  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: User.find(2))
    if @gossip.save
      flash[:success] = "Well done, your gossip has been created successfully !"
      redirect_to gossips_path
    elsif
      flash.now[:error] = true
      render :new
    end
  end

  def edit
    @gossip = Gossip.find(params[:id].to_i)
  end

  def update
    @gossip = Gossip.find(params[:id].to_i)
    if @gossip.update(title: params[:title], content: params[:content])
      flash[:success] = "Well done, your gossip has been updated successfully !"
      redirect_to gossips_path
    elsif
      flash.now[:error] = true
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id].to_i)
    if @gossip.delete
      flash[:success] = "Your gossip has been deleted successfully !"
      redirect_to gossips_path
    elsif
      flash.now[:error] = true
      render :show
    end
  end

private

  def authenticate_user
    unless current_user
    flash[:danger] = "Please log in."
    redirect_to new_session_path
    end
  end

end
