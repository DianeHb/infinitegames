class SearchesController < ApplicationController

  def show

  #display game on librarygames
  @my_games = current_user.library_games.map {|library_game| library_game.game }

  #display game on friends library
  @friend_games = current_user.friends.uniq.map do |friend|
    friend.library_games.map {|library_game| library_game.game }
  end
  @friend_games = @friend_games.flatten.uniq

  #Display game on general library
    @games = Game.all

    @filtered_games = @games

    if params[:name].present?

      @filtered_games = @filtered_games.where("name ILIKE ?", "%#{params[:name]}%")

    end
    if params[:min_age].present?

      @filtered_games = @filtered_games.where("min_age >= :min_age ", min_age: params[:min_age])

    end
    if params[:players_number].present?

      @filtered_games = @filtered_games.where("min_players <= :players_number AND max_players >= :players_number", players_number: params[:players_number])

    end

    if params[:duration].present?

      @filtered_games = @filtered_games.where("min_playtime <= :duration AND max_playtime >= :duration", duration: params[:duration])

    end

    @games        = @filtered_games - @friend_games - @my_games
    @my_games     = @filtered_games & @my_games
    @friend_games = (@filtered_games & @friend_games) - @my_games
  end
end
