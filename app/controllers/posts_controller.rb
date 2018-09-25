class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params(:title, :content, :summary, :category))
    @post.save
    if @post.valid?
      redirect_to @post
    else
      redirect_to new_post_path
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params(:title, :content, :summary, :category))
    redirect_to @post
  end

  private


# We pass the permitted fields in as *args;
# this keeps `Post_params` pretty dry while
# still allowing slightly different behavior
# depending on the controller action
  def post_params(*args)
    params.require(:post).permit(*args)
  end
end
