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

  def index
    @library_game = LibraryGame.find(params[:library_game_id])
    @game = @library_game.game
    @game_sessions = @game.game_sessions.where(user: current_user).order(date: :desc)

    @total_duration   = @game_sessions.sum(:duration)
    @average_duration = @game_sessions.average(:duration).to_i

    @victories_count  = GameSessionPlayer.where(
      game_session_id: @game_sessions.pluck(:id),
      player_id: current_user.id,
      player_type: "User",
      winner: true
    ).count

    @game_sessions__count_in_month = @game_sessions.where(date: Date.today.beginning_of_month..Date.today).count

    @game_sessions__count_in_year = @game_sessions.where(date: Date.today.beginning_of_year..Date.today).count

    @top_3_winners = GameSessionPlayer.select("player_id, player_type, count(id) AS won_sessions_count")
      .where(game_session_id: @game_sessions.pluck(:id), winner: true)
      .group("player_id, player_type")
      .order(won_sessions_count: :desc)
      .limit(3)

  end


  private

  def game_session_params
    params.require(:game_session).permit(:date, :duration, :comment, game_session_players_attributes: [:id, :_destroy, :winner, :score, :player_id, :player_type]) #Only friends/users at the moment
  end
end
