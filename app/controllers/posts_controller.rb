class PostsController < ApplicationController

  respond_to :html

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(safe_params)
    respond_with @post
  end


  private

  def safe_params
    safe_attributes = [
      :title,
      :content,
      tag_ids: [],
    ]
    params.require(:post).permit(*safe_attributes)
  end

end
