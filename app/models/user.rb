class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :library_games, foreign_key: :owner_id
  has_many :games, through: :library_games
  has_many :games_sessions
  has_many :guests

  def friends
    User.joins("INNER JOIN friendships ON friendships.friend1_id = #{id} OR friendships.friend2_id = #{id}").
      where(friendships: { status: 'accepted' }).
      where.not(id: id) #Don't want to get your id back
  end

end
