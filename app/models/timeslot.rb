class Timeslot < ActiveRecord::Base
  belongs_to :user
  has_many :offers

  def weekday
    time.wday
  end
end
