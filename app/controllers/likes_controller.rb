class LikesController < ApplicationController
before_action :authenticate_user, only: [:destroy, :create]

  def create
    @like = Like.create(user_id: current_user_id, gossip_id: params[:gossip_id] )
  end
  
  def destroy
    @like = Like.find(params[:id].to_i)
    @like.delete
  end

private

  def authenticate_user
    unless current_user
    flash[:danger] = "Please log in."
    redirect_to new_session_path
    end
  end

end
