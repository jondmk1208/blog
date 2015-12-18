class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]

	def index
	end
	
	def new
		@post = Post.new
	end

	def create
		@post = Post.new post_params

			if @post.save
				redirect_to @post, notice: "잘햇어~!! 넌 성공할수있어!!"
			else
		 		render 'new', notice: "Oh no, Jon do it again"
		 	end	
	end	

	def show

	end		

	def edit

	end
	
	def update
		if @post.update post_params
			redirect_to @post, notice: "Your article was successfully updated!"
		else
			render 'edit'
		end		
	end	

	def destroy
		@post.destroy
			redirect_to posts_path
	end	



	private

	def post_params
		params.require(:post).permit(:title, :content)
	end	

	def find_post
		@post = Post.find(params[:id])
	end	
end
