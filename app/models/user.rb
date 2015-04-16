class User < ActiveRecord::Base
  has_many :talents, :offers, :timeslots, :reputations

end
