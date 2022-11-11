class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    if @bookmark.save
      redirect_to list_path(@list), status: :see_other
    else
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list
    if @bookmark.destroy
      redirect_to list_path(@list), status: :see_other
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def bookmark_params
    params.require(:movie).permit(:title, :overview, :poster_url, :rating)
  end
end
