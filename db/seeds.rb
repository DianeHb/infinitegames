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


julien = User.create!(
  username: 'Beliar44',
  first_name: 'Julien',
  last_name: 'Devautour'
  avatar_url: "https://kitt.lewagon.com/placeholder/users/beliar44"
  email: 'julien@test.com',
  password: 'secret123456'
)

nadia = User.create!(
  username: 'Nadia',
  first_name: 'Nadia',
  last_name: 'Leteurtre'
  avatar_url: "https://kitt.lewagon.com/placeholder/users/nadialet9"
  email: 'nadia@test.com',
  password: 'secret123456'
)

diane = User.create!(
  username: 'Diane',
  first_name: 'Diane',
  last_name: 'Hubau'
  avatar_url: "https://kitt.lewagon.com/placeholder/users/DianeHb"
  email: 'diane@test.com',
  password: 'secret123456'
)

cecile = User.create!(
  username: 'Cécile',
  first_name: 'Cécile',
  last_name: 'Veneziani'
  avatar_url: "https://kitt.lewagon.com/placeholder/users/cveneziani"
  email: 'cecile@test.com',
  password: 'secret123456'
)

nicolas = User.create!(
  username: 'Nicolas',
  first_name: 'Nicolas',
  last_name: 'Filzi'
  avatar_url: "https://kitt.lewagon.com/placeholder/users/nfilzi"
  email: 'nicolas@test.com',
  password: 'secret123456'
)

seb = User.create!(
  username: 'Seb',
  first_name: 'Sébastien',
  last_name: 'Saunier'
  avatar_url: "https://kitt.lewagon.com/placeholder/users/ssaunier"
  email: 'nicolas@test.com',
  password: 'secret123456'
)

nathan = User.create!(
  username: 'Nathan',
  first_name: 'Nathan',
  last_name: 'Menard'
  avatar_url: "https://kitt.lewagon.com/placeholder/users/NathanMenard"
  email: 'nathan@test.com',
  password: 'secret123456'
)

melanie = User.create!(
  username: 'Mélanie',
  first_name: 'Mélanie',
  last_name: 'Rat'
  avatar_url: "https://kitt.lewagon.com/placeholder/users/???"
  email: 'melanie@test.com',
  password: 'secret123456'
)

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
    boardgamesatlas_id: category["id"]
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
    boardgamesatlas_id: mechanic["id"]
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
