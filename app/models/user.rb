class User < ActiveRecord::Base
  has_secure_password
  validates :username, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: {with: VALID_EMAIL_REGEX}
  has_many :talents, :offers, :timeslots, :reputations
  validates :location, presence: true

end
