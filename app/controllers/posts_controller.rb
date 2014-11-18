class PostsController < ApplicationController
  def index
    @posts = Post.order(:id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy

    redirect_to posts_path
  end

  def up_vote
    Post.increment_counter(:points, params[:id])
    redirect_to posts_url
  end

  def down_vote
    Post.decrement_counter(:points, params[:id])
    redirect_to posts_url
  end

  private
    def post_params
      params.require(:post).permit(:title, :url)
    end
end
