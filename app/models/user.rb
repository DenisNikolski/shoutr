class User < ApplicationRecord
  include Clearance::User

  validates :username, presence: true, uniqueness: true

  def self.find_user_by_email_or_name(email_or_username)
    User.where(email: email_or_username)
        .or(User.where(username: email_or_username)).first
  end
end
