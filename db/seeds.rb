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
Friendship.destroy_all
Review.destroy_all
User.destroy_all
Game.destroy_all
Category.destroy_all
Mechanic.destroy_all

#*********************USERS*************************
p "Seeds for Users"

User.create!(
  username: 'Beliar44',
  first_name: 'Julien',
  last_name: 'Devautour',
  avatar_url: "https://kitt.lewagon.com/placeholder/users/beliar44",
  email: 'julien@test.com',
  password: 'secret123456'
)

User.create!(
  username: 'Nadia',
  first_name: 'Nadia',
  last_name: 'Leteurtre',
  avatar_url: "https://kitt.lewagon.com/placeholder/users/nadialet9",
  email: 'nadia@test.com',
  password: 'secret123456'
)

User.create!(
  username: 'Diane',
  first_name: 'Diane',
  last_name: 'Hubau',
  avatar_url: "https://kitt.lewagon.com/placeholder/users/DianeHb",
  email: 'diane@test.com',
  password: 'secret123456'
)

User.create!(
  username: 'Cécile',
  first_name: 'Cécile',
  last_name: 'Veneziani',
  avatar_url: "https://kitt.lewagon.com/placeholder/users/cveneziani",
  email: 'cecile@test.com',
  password: 'secret123456'
)

User.create!(
  username: 'Nicolas',
  first_name: 'Nicolas',
  last_name: 'Filzi',
  avatar_url: "https://kitt.lewagon.com/placeholder/users/nfilzi",
  email: 'nicolas@test.com',
  password: 'secret123456'
)

User.create!(
  username: 'Seb',
  first_name: 'Sébastien',
  last_name: 'Saunier',
  avatar_url: "https://kitt.lewagon.com/placeholder/users/ssaunier",
  email: 'seb@test.com',
  password: 'secret123456'
)

User.create!(
  username: 'Boris',
  first_name: 'Boris',
  last_name: 'Paillard',
  avatar_url: "https://kitt.lewagon.com/placeholder/users/papillard",
  email: 'boris@test.com',
  password: 'secret123456'
)

User.create!(
  username: 'Nathan',
  first_name: 'Nathan',
  last_name: 'Menard',
  avatar_url: "https://kitt.lewagon.com/placeholder/users/nathanmenard",
  email: 'nathan@test.com',
  password: 'secret123456'
)

User.create!(
  username: 'Mélanie',
  first_name: 'Mélanie',
  last_name: 'Rat',
  avatar_url: "https://kitt.lewagon.com/placeholder/users/Melrt",
  email: 'melanie@test.com',
  password: 'secret123456'
)

User.create!(
  username: 'Florent',
  first_name: 'Florent',
  last_name: 'Guilbaud',
  avatar_url: "https://kitt.lewagon.com/placeholder/users/TaoGuerreiro",
  email: 'florent@test.com',
  password: 'secret123456'
)

User.create!(
  username: 'Maëlie',
  first_name: 'Maëlie',
  last_name: 'Poussier',
  avatar_url: "https://kitt.lewagon.com/placeholder/users/maelie-poussier",
  email: 'maelie@test.com',
  password: 'secret123456'
)

User.create!(
  username: 'JJ',
  first_name: 'Jean-Julien',
  last_name: 'Bernard',
  avatar_url: "https://kitt.lewagon.com/placeholder/users/Rakido",
  email: 'jj@test.com',
  password: 'secret123456'
)

users = User.all
users_number = users.length

p "Seeds for users done!"

#*********************CATEGORIES*************************

p "Seeds for Category"

file_path = "db/fixtures/json/categories.json"

categories_serialized = open(file_path).read
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

file_path = "db/fixtures/json/mechanics.json"

mechanics_serialized = open(file_path).read
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

file_path = "db/fixtures/json/populargames100.json"

games_serialized = open(file_path).read
data = JSON.parse(games_serialized)

games = data["games"]

games.each do |game|
  #Create Game
  new_game = Game.create!(
    name:         game["name"],
    description:  game["description"], #CAREFUL DISPLAY RAILS SHOULD APPLY HTML
    min_players:  game["min_players"],
    max_players:  game["max_players"],
    min_age:      game["min_age"],
    min_playtime: game["min_playtime"],
    max_playtime: game["max_playtime"],
    editor:       game["primary_publisher"]["name"],
    creators:     game["artists"].join(', '),
    image_url:    game["image_url"],
    rules_url:    game["rules_url"],
  )

  #Create links with mechanics
  mechanics = game["mechanics"]
  mechanics.map! do |mechanic|
    mechanic["id"]
  end

  mechanics.each do |mechanic_id|
    mechanic = Mechanic.find_by(boardgamesatlas_id: mechanic_id)
    next unless mechanic

    GameMechanic.create!(
      mechanic: mechanic,
      game: new_game
    )
  end

  #Create links with categories
  categories = game["categories"]
  categories.map! do |category|
    category["id"]
  end

  categories.each do |category_id|
    category = Category.find_by(boardgamesatlas_id: category_id)
    next unless category

    GameCategory.create!(
      category: category,
      game: new_game
    )
  end

end

games = Game.all
games_number = games.length

p "Seeds for games done!"

#*********************REVIEWS*************************
p "Seeds for Reviews"

# COMMENTS_0 = ["Didn't like this game at all", "Wouldn't play this game even if it was the only one!", "Awful"]
# COMMENTS_1 = ["Not my type of games!", "Not so fun...", "Definitely wouldn't recommend this", "Boring..."]
# COMMENTS_2 = ["Not great but not too bad", "My family didn't have fun playing this", "Rules were definitely too complicated so we couldn't play!", "Not a huge fan", "Good enough when you're bored", "Wouldn't recommend...", "Kinda boring..."]
COMMENTS_3 = ["Okay for a family week-end", "Not the best game but enough to have a good time", "Worth the try!", "Rules a bit complicated but once you made it, it's nice!", "Would be great if it didn't take so long to get into it", "Difficult to begin but after it's nice"]
COMMENTS_4 = ["Great entertainement 😀", "Really enjoyed playing this!", "Playing this game every games night", "Go for it!", "Nice Game!", "Beautiful game, the design is awesome!", "Everyone in the house love this game!"]
COMMENTS_5 = ["Favorite game ever, it's awesome! 💗","Would definitely recommend, this game is great!", "Mind blowing!", "Fantastic", "Loving this", "Once you've this game, you can't stop playing!"]

games.each do |game|
  users.shuffle.first(5).each do |user|
    rating = rand(3..5)
    Review.create!(
      game: game,
      rating: rating,
      user: user,
      text: "COMMENTS_#{rating}".constantize.sample
    )
  end
  ratings = 0
  ratings_nb = game.reviews.length
  game.reviews.each do |review|
    ratings += review.rating
  end
  game.rating_general = (ratings/ratings_nb).round(1)
  game.save!
end

p "Seeds for reviews done!"

#*********************FRIENDS*************************

p "Seeds for Friends"

friends_possibilities = (2..6)
users.each do |user|
  friends = user.friends
  n = rand(friends_possibilities)
  friends_list = users.sample(n).reject { |person| person == user || friends.include?(person) } #NEED TO EXCLUDE CURRENT USER
  friends_list.each do |friend|
    Friendship.create!(
      friend1: user,
      friend2: friend,
      status: "accepted"
    )
  end
end

p "Seeds for friends done!"

#*********************GUESTS*************************

p "Seeds for Guests"

GUESTS_NAMES = ["Ophélie", "Caroline", "Lise", "Coralie", "Maxime", "Gabriel", "Pierre", "Martin", "Kévin", "Marc", "Stéphane", "Nicolas", "Olivier", "Mickaël", "Ludovic", "Yann", "David", "Emile", "Clara", "Jérémy", "Morgane", "Thibaut", "Fanny", "Ariane", "Julien", "Adrienne"]

users.each do |user|
  number_of_guests = rand(1..6)
  users_guests = GUESTS_NAMES.sample(number_of_guests)
  users_guests.each do |guest|
    Guest.create!(
      name: guest,
      user: user
    )
  end
end

p "Seeds for guests done!"

#*********************LIBRARY GAMES*************************

p "Seeds for Library Games"
games_possibilities = (10..50)

users.each do |user|
  number_of_games = rand(games_possibilities)
  users_games = games.sample(number_of_games)
  users_games.each do |game|
    LibraryGame.create!(
      game: game,
      owner: user
    )
  end

  user_library_games_to_lend = ((user.library_games.length)/3).round
  lend_possibilities = (2..user_library_games_to_lend)
  number_of_games_to_lend = rand(lend_possibilities)

  user.library_games.shuffle.first(number_of_games_to_lend).each do |library_game|
    library_game.borrowed = true
    library_game.borrower = (user.friends + user.guests).sample
    library_game.borrowed_date = Date.new(2020,rand(6..11),rand(1..30))
    library_game.save!
  end

end

p "Seeds for library games done!"

#*********************GAMES SESSIONS*************************

p "Seeds for Games Sessions"

COMMENTS = ["", "", "", "", "", "", "", "", "", "", "Fun night with lots of Tacos", "Need to play this more often!", "It was easier to play without the extension on this!", "NB for later don't play this game in the evening too much concentration needed", "Much harder than usual!", "Great job everyone!"]

users.each do |user|
  user.library_games.each do |library_game|
    n = rand(4..10) #4 Sessions to make sure the podium has at least 3 winners for each game
    n.times do
      game_session = GameSession.create!(
        game: library_game.game,
        date: Date.new(rand(2018..2020),rand(1..11),rand(1..28)), #28 because of February, 11 months to avoid exception on December 2020 which will not be finished on DemoDay
        user: user,
        duration: rand(20..120),
        comment: COMMENTS.sample
      )

      friends = user.friends
      guests = user.guests
      acquaintances = friends.length + guests.length

      max = acquaintances < game_session.game.max_players ? acquaintances : game_session.game.max_players
      n = rand(game_session.game.min_players..max)

      players = (user.friends + user.guests).sample(n-1) #1 withdrawn because we add the user below
      players << user

      players.each do |player|
        GameSessionPlayer.create!(
          game_session: game_session,
          player: player,
          score: rand(50..120)
        )
      end

      max_score = 0
      game_session.game_session_players.each do |player|
        max_score = player.score if player.score > max_score
      end

      winners = game_session.game_session_players.where("score=#{max_score}")
      winners.each do |winner_player|
        winner_player.winner = true
        winner_player.save!
      end

    end
  end
end

p "Seeds for games sessions done!"

#*********************END*************************

p "All Seeds done!"
