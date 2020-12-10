class LibraryGamesController < ApplicationController
  def index
    @games = current_user.library_games.order(:game_id)
    #Order by the name of the game
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

    @game_session          = GameSession.new
    @game_session_player   = GameSessionPlayer.new

    @friends = current_user.friends.order(:first_name, :last_name)
    @guests  = current_user.guests.order(:name)

    @review         = Review.new
    @reviews        = @game.game.reviews

    @average_rating = @reviews.average(:rating)

    @user_review    = @reviews.find_by(user_id: current_user.id)


    #For th poduim and the statistics

    @game_sessions = @game.game.game_sessions.where(user: current_user).order(date: :desc)

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

    @top_player_1, @top_player_2, @top_player_3 = @top_3_winners



  end

  def lend
    @game           = current_user.library_games.find(params[:id])
    @game.update(game_params)
    @game.borrowed  = true
    if @game.save
      redirect_to library_game_path(@game)
    else
      redirect_to library_game_path(@game) #RENDER LA MODAL ?
    end
  end

  def retrieve
    @game           = current_user.library_games.find(params[:id])
    @game.borrowed  = false
    @game.borrower  = nil
    @game.borrowed_date = nil
    @game.save
    redirect_to library_game_path(@game)
  end

  def lent
    @lent_games = current_user.library_games.where("borrowed=true")
  end

  private

  def game_params
    params.require(:library_game).permit(:borrower_id, :borrower_type, :borrowed_date)
  end

end
