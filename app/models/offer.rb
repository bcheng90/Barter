class Offer < ActiveRecord::Base
  belongs_to :user, :timeslot
end
