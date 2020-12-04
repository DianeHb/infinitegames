class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @library_game = LibraryGame(params[:id])
    if @review.save
      redirect_to @library_game , notice: 'review was successfully created.'
    else
      # render :show ???
    end
  end


private
  def review_params
    params.require(:review).permit(:rating, :text)
  end
end
