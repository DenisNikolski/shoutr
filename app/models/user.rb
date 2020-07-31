class User < ApplicationRecord
  include Clearance::User

  validates :username, presence: true, uniqueness: true

  has_many :shouts, dependent: :destroy
  has_many :likes
  has_many :liked_shouts, through: :likes, source: :shout

  has_many :followed_user_relationships,
           foreign_key: :follower_id,
           class_name: 'FollowingRelationship',
           dependent: :destroy
  has_many :followed_user, through: :followed_user_relationships

  has_many :follower_relationships,
           foreign_key: :followed_user_id,
           class_name: 'FollowingRelationship',
           dependent: :destroy
  has_many :followers, through: :follower_relationships

  def like(shout)
    liked_shouts << shout
  end

  def unlike(shout)
    liked_shouts.destroy(shout)
  end

  def liked?(shout)
    liked_shout_ids.include?(shout.id)
  end

  def to_param
    username
  end

  def follow(user)
    followed_user << user
  end

  def unfollow(user)
    followed_user.delete(user)
  end

  def following?(user)
    followed_user_ids.include?(user.id)
  end

  def self.find_user_by_email_or_name(email_or_username)
    User.where(email: email_or_username)
        .or(User.where(username: email_or_username)).first
  end
end
