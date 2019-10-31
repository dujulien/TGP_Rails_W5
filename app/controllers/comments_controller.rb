class CommentsController < ApplicationController
before_action :authenticate_user, only: [:new, :edit, :update, :destroy, :create]

  def index
  end

  def show
  end

  def new
  end
  
  def create
    @gossip = Gossip.find(params[:gossip_id].to_i)
    @comment = Comment.new(content: params[:content], gossip: @gossip, user: current_user)
    if @comment.save
      flash[:success] = "Well done, your comment has been created successfully !"
      redirect_to gossip_path(params[:gossip_id].to_i)
    elsif
      flash.now[:danger] = "The comment could not be created"
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id].to_i)
    if @comment.user != current_user
      flash[:danger] = "You cannot edit this comment."
      redirect_to gossip_path(params[:gossip_id].to_i)
    end
  end

  def update
    @comment = Comment.find(params[:id].to_i)
    if @comment.user == current_user
      if @comment.update(content: params[:content])
        flash[:success] = "Well done, your comment has been updated successfully !"
        redirect_to gossip_path(params[:gossip_id].to_i)
      elsif
        flash.now[:error] = true
        render :edit
      end
    else
      flash[:danger] = "You cannot modify this comment."
      redirect_to gossip_path(params[:gossip_id].to_i)
    end
  end

  def destroy
    @comment = Comment.find(params[:id].to_i)
    if @comment.user == current_user
      if @comment.delete
        flash[:success] = "Well done, your comment has been deleted successfully !"
        redirect_to gossip_path(params[:gossip_id].to_i)
      elsif
        flash.now[:error] = true
        redirect_to gossip_path(params[:gossip_id].to_i)
      end
    else
      flash[:danger] = "You cannot delete this comment."
      redirect_to gossip_path(params[:gossip_id].to_i)
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
