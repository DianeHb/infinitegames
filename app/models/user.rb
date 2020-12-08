class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :library_games, foreign_key: :owner_id, dependent: :destroy
  has_many :games, through: :library_games
  has_many :game_sessions, dependent: :destroy
  has_many :guests, dependent: :destroy

  def friends
    friendships = Friendship.where(status: 'accepted').where('friend1_id = :id OR friend2_id = :id', id: id)
    user_ids   = friendships.pluck(:friend1_id) + friendships.pluck(:friend2_id)
    User.where.not(id: id).where(id: user_ids)
  end

  # def friends
  #   User.joins("INNER JOIN friendships ON friendships.friend1_id = #{id} OR friendships.friend2_id = #{id}").
  #     where(friendships: { status: 'accepted' }).
  #     where.not(id: id) # Don't want to get your id back
  # end

end
