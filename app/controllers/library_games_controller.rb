class LibraryGamesController < ApplicationController
  def index
    @games = current_user.library_games
  end

  def create
    @game = Game.find(params[:game_id])
    @library_game = LibraryGame.new(
      game: @game,
      owner: current_user
    )
    if @library_game.save
      redirect_to library_game_path(@library_game)
    else
      redirect_to library_games_path
    end
  end

  def show
    @game           = current_user.library_games.find(params[:id])

    @game_session = GameSession.new
    @game_session_player = GameSessionPlayer.new
    @friends = [current_user] + current_user.friends.order(:first_name, :last_name)


    @review         = Review.new
    @reviews        = @game.game.reviews

    @average_rating = @reviews.average(:rating)

    @user_review    = @reviews.find_by(user_id: current_user.id)

  end

  def lend
    @game = LibraryGame.find(params[:id])
    @game.borrowed = true
  end
end
