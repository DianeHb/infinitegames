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

end
