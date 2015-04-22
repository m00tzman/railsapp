class SessionsController < ApplicationController
	def new 
	end

	def create
		user = User.find_by(email: params[:email])

		if user && user.authenticate(params[:password])
			#happy path - user logged in
			session[:user_id] = user.id
			redirect_to :root, notice: "You have been logged in!"
		else
			flash[:alert] = "Invalid email or password"
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to :root, notice: "Successfully logged out!"
	end
end