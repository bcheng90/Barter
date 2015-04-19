class Timeslot < ActiveRecord::Base
  belongs_to :user
  has_many :offers

  def weekday
    time.wday
  end

  def mcrsec
    time.to_i*1000
  end

  def hours
    time.to_s.split(" ")[1].split(":").first + ":00"
  end
end
