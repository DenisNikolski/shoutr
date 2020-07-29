class User < ApplicationRecord
  include Clearance::User

  validates :username, presence: true, uniqueness: true

  has_many :shouts, dependent: :destroy
  has_many :likes
  has_many :liked_shouts, through: :likes, source: :shout

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

  def self.find_user_by_email_or_name(email_or_username)
    User.where(email: email_or_username)
        .or(User.where(username: email_or_username)).first
  end
end
