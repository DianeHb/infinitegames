# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'


p "Destroy existing seeds"
User.destroy_all
Category.destroy_all
Mechanic.destroy_all
Game.destroy_all
Review.destroy_all
GameSession.destroy_all

#*********************USERS*************************
p "Seeds for Users"
p "Seeds for users done!"

#*********************CATEGORIES*************************

p "Seeds for Category"

url = "https://api.boardgameatlas.com/api/game/categories?client_id=JLBr5npPhV"

categories_serialized = open(url).read
data = JSON.parse(categories_serialized)

categories = data["categories"]

categories.each do |category|
  Category.create!(
    name: category["name"],
    id_api: category["id"]
  )
end
p "Seeds for categories done!"

#*********************MECHANICS*************************

p "Seeds for Mechanic"

url = "https://www.boardgameatlas.com/api/game/mechanics?client_id=JLBr5npPhV"

mechanics_serialized = open(url).read
data = JSON.parse(mechanics_serialized)

mechanics = data["mechanics"]

mechanics.each do |mechanic|
  Mechanic.create!(
    name: mechanic["name"],
    id_api: mechanic["id"]
  )
end

p "Seeds for mechanics done!"

#*********************GAMES*************************

p "Seeds for Games"
p "Seeds for games done!"

#ARRAY OU UN HASH DE GAMES
# FOR EACH GAME
# LINK WITH CATEGORIES & MECHANICS TO CREATE




#*********************REVIEWS*************************

p "Seeds for Reviews"
p "Seeds for reviews done!"


p "All Seeds done!"
