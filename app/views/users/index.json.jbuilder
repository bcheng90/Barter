json.array! @users do |user|
  json.username user.username
  json.id user.id
  json.email user.email
  json.interests user.interests
  json.score user.score
  json.talents user.talents do |talent|
     json.title talent.title
     json.type talent.type
     json.user_id talent.user_id
     json.sample talent.sample
     json.experience talent.experience
     json.desciption talent.description
  end
  json.timeslots user.timeslots do |ts|
    json.time ts.time
    json.weekday ts.weekday
    json.user_id ts.user_id
    json.offer_id ts.offer_id
  end
  json.location user.location
  json.about user.about
end
