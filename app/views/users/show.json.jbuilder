json.id @user.id
json.username @user.username
json.email @user.email
json.interests @user.interests
json.score @user.score
json.offers @user.offers do |offer|
  json.id offer.id
  json.student_id offer.student_id
  json.status offer.status
  json.timeslot_id offer.timeslot_id
end
json.reputations @user.reputations do |reputation|
  json.id reputation.id
  json.user_id reputation.user_id
  json.judge_id reputation.judge_id
  json.rating reputation.rating
end
json.talents @user.talents do |talent|
   json.id talent.id
   json.title talent.title
   json.type talent.type
   json.user_id talent.user_id
   json.sample talent.sample
   json.experience talent.experience
   json.description talent.description
end
json.timeslots @user.timeslots do |ts|
  json.id ts.id
  json.time ts.time
  json.hours ts.hours
  json.test ts.time.to_f * 1000
  json.weekday ts.weekday
  json.user_id ts.user_id
  json.offer_id ts.offer_id
  json.mcrsec ts.mcrsec
  json.hour ts.time.to_s.split(" ")[1].split(":").first+ ":00 pm"
  json.offers ts.offers do |of|
    json.id of.id
    json.status of.status
    json.timeslot_id of.timeslot_id
    json.student of.student
    json.student_score of.student.score
    json.student_talents of.student.talents do |talent|
      json.title talent.title
      json.type talent.type
    end
  end
end
json.location @user.location
json.about @user.about
