class GossipController < ApplicationController

  def homesecret
  	@user_name = params[:user_name]
  	@all_gossips = Gossip.all
  end

  def home
  	@all_gossips = Gossip.all
  end

  def create_gossip
  end

  def team
  end

  def contacts
  end

  def user
  	@user = User.find(params[:id].to_i)
  end

  def index
  	@gossip = Gossip.find(params[:id].to_i)
  end

end
