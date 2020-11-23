class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @bloggers = Blogger.all
    @posts = Post.all
    @destinations = Destination.all 
  end

  def create
    @post = Post.create(post_params)
    if @post.valid?
      redirect_to post_path(@post)
    else
      flash[:my_errors] = @post.errors.full_messages
      redirect_to new_post_path
    end
  end

  # def edit
  #   @post = Post.find(params[:id])
  # end 

  def likes
    @post = Post.find(params[:id])
    @post.likes += 1
    @post.save
    #redirect_to post_path(@post)
  end

  def update
    @post = Post.find(params[:id])
    @post.update(likes: @post.likes += 1)
    redirect_to post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :destination_id, :blogger_id, :content, :likes)
  end
end
