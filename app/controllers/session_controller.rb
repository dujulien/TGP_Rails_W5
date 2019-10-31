class SessionController < ApplicationController
	def new
	end

	def create
	  user = User.find_by(email: params[:email])

	  if user && user.authenticate(params[:password])
	    session[:user_id] = user.id
	    flash[:success] = "You successfully logged in !"
	    redirect_to gossips_path
	  else
	    flash.now[:error] = 'Invalid email/password combination'
	    render 'new'
	  end
	end

	def destroy
		session.delete(:user_id)
		flash[:success] = "You successfully logged out !"
		redirect_to gossips_path
	end
end
