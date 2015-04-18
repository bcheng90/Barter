class User < ActiveRecord::Base
  has_secure_password
  has_many :talents
  has_many :offers, through: :timeslots
  has_many :timeslots
  has_many :reputations

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: {with: VALID_EMAIL_REGEX}
  validates :username, uniqueness: true

end
