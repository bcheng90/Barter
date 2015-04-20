class Offer < ActiveRecord::Base
  belongs_to :student, class_name: 'User', :foreign_key => :student_id
  belongs_to :timeslot

  after_save :decline_others_in_timeslot

   def decline_others_in_timeslot
      Offer.where(timeslot: timeslot).where('id != ? ', id).delete_all if status == true
   end

end
