class CommentsController < ApplicationController
	def index
		@comments = Comment.all
	end

	def create
		@comment = current_user.comments.create(comment_params)
		if @comment
			flash[:notice] = "Your comment was created successfully"
			redirect_to post_path Post.find(@comment.post_id)
		else
			flas[:alert] = "There was a problem saving your comment."
			redirect_to new_comment_path
		end
	end

	def new
		@comment = Comment.new
	end

	def edit
		@comment = Comment.find(params[:id])
	end

	def show
		@comment = Comment.find(params[:id])
		@user = User.find(@comment.user_id)
		@post = Post.find(@comment.post_id)
	end

	def update
		comment = Comment.find(params[:id])
		comment.update_attributes(comment_params)
		redirect_to comment
	end

	def destroy
		Comment.find(params[:id]).destroy
		redirect_to "/posts"
	end

	private

	def comment_params
		params.require(:comment).permit(:body, :user_id, :post_id)
	end
end
