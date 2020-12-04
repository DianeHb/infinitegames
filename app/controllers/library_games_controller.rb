class LibraryGamesController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @library_game = LibraryGame.new(
      game: @game,
      owner: current_user
    )

    # @library_game.save!

    if @library_game.save
      redirect_to game_path(@game)
      # redirect_to library_game_path(@library_game)
    else
      redirect_to root_path
      #RENDER AN ERROR MESSAGE ?
    end
  end

end
