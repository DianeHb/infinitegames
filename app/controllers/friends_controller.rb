class FriendsController < ApplicationController
  def index
    @friends = current_user.friends.order(:first_name, :last_name)
    @guests  = current_user.guests.order(:name)
  end
end
