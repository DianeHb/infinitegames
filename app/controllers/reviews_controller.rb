class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @game = Game.find(params[:game_id])
    @library_game = current_user.library_games.find_by(game_id: @game.id)
    @review.game = @game
    @review.user = current_user
    if @review.save
      redirect_to @library_game , notice: 'review was successfully created.'
    else
      render "library_games/show"
    end
  end


private
  def review_params
    params.require(:review).permit(:rating, :text)
  end
end
