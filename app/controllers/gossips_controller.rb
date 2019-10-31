class GossipsController < ApplicationController

  def index_secret
  	@user_name = params[:user_name]
  	@all_gossips = Gossip.all
  end

  def index
  	@all_gossips = Gossip.all
    @gossip = Gossip.new
  end

  def show
    @gossip = Gossip.find(params[:id].to_i)
  end

  def new
    @gossip = Gossip.new
  end
  
  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content])
    if @gossip.save
      flash[:success] = "Well done, your gossip has been created !"
      redirect_to gossips_path
    else
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
