class LibraryGamesController < ApplicationController

  def index
    @games = current_user.library_games
  end
end
