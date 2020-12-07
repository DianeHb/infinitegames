class GameSessionsController < ApplicationController
  def create
    @game_session = GameSession.new(game_session_params)
    @library_game = LibraryGame.find(params[:library_game_id])
    @game = @library_game.game
    @game_session.game = @game
    @game_session.user = current_user
    if @game_session.save!
      redirect_to library_game_path(@library_game)
    else
      redirect_to library_game_path(@library_game) #REDIRECT TO MODAL ??
    end
  end

  private

  def game_session_params
    params.require(:game_session).permit(:date, :duration, :comment, game_session_players_attributes: [:id, :_destroy, :winner, :score, :player_id, :player_type]) #Only friends/users at the moment
  end
end
