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

    @game_session          = GameSession.new
    @game_session_player   = GameSessionPlayer.new

    @friends = current_user.friends.order(:first_name, :last_name)
    @guests  = current_user.guests.order(:name)

    @review         = Review.new
    @reviews        = @game.game.reviews

    @average_rating = @reviews.average(:rating)

    @user_review    = @reviews.find_by(user_id: current_user.id)

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
