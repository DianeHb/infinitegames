class LibraryGamesController < ApplicationController
  def create
    @library_game = LibraryGame.new(library_game_params)
    @game = Game.find(params[:game_id])
    @library_game.game = @game
    @library_game.owner = current_user
    if @library_game.save
      redirect_to library_game_path(@library_game)
    else
      #RENDER THE MESSAGE
    end
  end

  private

  def library_game_params
    params.require(:library_game).permit()
  end

end
