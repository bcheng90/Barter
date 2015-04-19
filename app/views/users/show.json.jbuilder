json.username @user.username
json.email @user.email
json.interests @user.interests
json.talents @user.talents do |talent|
   json.title talent.title
   json.type talent.type
   json.user_id talent.user_id
   json.sample talent.sample
   json.experience talent.experience
   json.desciption talent.description
end
json.timeslots @user.timeslots do |ts|
  json.time ts.time
  json.weekday ts.weekday
  json.user_id ts.user_id
  json.offer_id ts.offer_id
  json.mcrsec ts.mcrsec
  json.hour ts.time.to_s.split(" ")[1].split(":").first+ ":00 pm"
  json.offers ts.offers do |of|
    json.timeslot_id of.timeslot_id
    json.student_id of.student_id
    json.status of.status
  end
end
json.location @user.location
json.about @user.about