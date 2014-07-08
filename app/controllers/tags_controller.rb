class TagsController < ApplicationController

  respond_to :html

  def index
    @tags = Tag.all
    @tag = Tag.new
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def create
    @tag = Tag.create(safe_params)
    respond_with @tag, location: tags_url, action: :index
  end


  private

  def safe_params
    params.require(:tag).permit(:name)
  end

end
