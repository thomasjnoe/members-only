class PostsController < ApplicationController
	before_action :signed_in_user, only: [:new, :create]

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	@post.user_id = current_user.id 

  	if @post.save
  		flash[:success] = "Post Successful!"
  		redirect_to posts_path
  	else
  		flash.now[:danger] = "Uh oh, your post wasn't successful :("
  		render 'new'
  	end
  end

  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end

  private

  	def post_params
  		params.require(:post).permit(:title, :body)
  	end

  	def signed_in_user
  		unless signed_in?
  			flash[:danger] = "You must sign in first"
  			redirect_to login_url
  		end
  	end
end
