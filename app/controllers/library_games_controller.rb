class LibraryGamesController < ApplicationController
  def index
    @games = current_user.library_games
  end

  def create
    # @game = Game.find(params[:game_id])
    # @library_game = LibraryGame.new(
    #   @library_game.game = @game
    #   @library_game.owner = current_user
    # )
    # if @library_game.save
    #   redirect_to game_path(@game)
    #   # redirect_to library_game_path(@library_game)
    # else
    #   #RENDER AN ERROR MESSAGE ?
    # end
  end


  def show
    @game           = current_user.library_games.find(params[:id])

    @review         = Review.new
    @reviews        = @game.game.reviews

    @average_rating = @reviews.average(:rating)

    @user_review    = @reviews.find_by(user_id: current_user.id)



  end
end
