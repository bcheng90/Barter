class Timeslot < ActiveRecord::Base
  belongs_to :user
  has_many :offers

  def weekday
    time.wday
  end

  def mcrsec
    time.to_i*1000
  end
end
