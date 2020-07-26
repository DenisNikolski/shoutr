class Shout < ApplicationRecord
  belongs_to :user

  validates :body, presence: true, length: { in: 1..256 }
  validates :user, presence: true
end
