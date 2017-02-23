# require 'byebug'

class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def create
		# byebug
		@post = Post.create(post_params)
		if @post
			flash[:notice] = "Your post was created successfully."
			redirect_to post_path @post
		else
			flash[:alert] = "There was a problem saving your post."
			redirect_to new_post_path
		end
	end

	def new
		@post = Post.new
	end

	def edit
		@post = Post.find(params[:id])
	end

	def show
		@post = Post.find(params[:id])
		@user = User.find(@post.user_id)
	end

	def update
		post = Post.find(params[:id])
		post.update_attributes(post_params)
		redirect_to post
	end

	def destroy
		Post.find(params[:id]).destroy
		redirect_to "/posts"
	end

	private

	def post_params
		params.require(:post).permit(:title, :body, :user_id)
	end # helps prevent mass assignment attack
end
