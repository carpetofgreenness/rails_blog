class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def create
		@user = User.create(user_params)
		if @user.save
			flash[:notice] = "Your account was created successfully."
			redirect_to user_path @user
		else
			flash[:alert] = "There was a problem saving your account."
			redirect_to new_user_path
		end
	end

	def new
		@user = User.new
	end

	def edit
		@user = User.find(params[:id])
	end

	def show
		@user = User.find(params[:id])
		@posts = @user.posts
	end

	def update
		user = User.find(params[:id])
		user.update_attributes(user_params)
		redirect_to user
	end

	def destroy
	  	User.find(params[:id]).destroy
	  	redirect_to "/users"
	end

	def signin

	end

	def lookup
	  @user = User.where(email: params[:email]).first
	  if @user && @user.password == params[:password]
	    session[:user_id] = @user.id
	    flash[:notice] = "Hello #{@user.first_name}, you are now logged in."
	    redirect_to @user
	  else
	    flash[:notice] = "Sorry, your login didn't work. Try again"
	    redirect '/'
	  end
	end

	def logout
		session.clear
		flash[:notice] = "You've successfully signed out!"
		redirect_to '/'
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password)
	end # helps prevent mass assignment attack
end
