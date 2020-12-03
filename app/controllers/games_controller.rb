class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @games = Game.all

    if params[:query].present?
      @games = @games.where("name ILIKE ?", "%#{params[:query]}%")
    end

    if params[:age].present?
      @games = @games.where("min_age ILIKE ?", "%#{params[:age]}%")
    end
    if params[:players_number].present?
      @games = @games.where("min_players <= :players_number AND max_players >= :players_number", players_number: params[:players_number])
    end

    if params[:duration].present?
      @games = @games.where("min_playtime <= :duration AND max_playtime >= :duration", duration: params[:duration])
    end

  end
end
