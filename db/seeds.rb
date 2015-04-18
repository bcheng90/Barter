usernames = ["notika", "benjamin","ryan"]
emails = ["notika@gmail.com", "ben@gmail.com", "ryan@gmail.com"]
locations = ["NYC, 28 MC Cabe str", "234 Wall str, Long Island", "160 Essex str NYC"]
interests = ["Guitar playing", "dance", "coding", "cooking", "biking", "eating"]
password = ["123"]

3.times do |i|
  user = User.create(username: usernames[i], email: emails[i], location: locations[i], interests: interests[i], password: "123")
  2.times do |i|
    user.timeslots << Timeslot.create(time: "2013-02-02 #{rand(1..24)}:00:00" , user_id: user.id)
  end
end
natalia = User.first
ryan = User.all[1]
ben = User.all[2]

4.times do |i|
  natalia.reputations << Reputation.create!(judge_id: [2,3].sample, rating: [1,2,3,4,5].sample)
  ryan.reputations << Reputation.create!(judge_id: [1,3].sample, rating: [1,2,3,4,5].sample)
  ben.reputations << Reputation.create!(judge_id: [2,1].sample, rating: [1,2,3,4,5].sample)
end

Talent.create([{title: "Cooking", type: "Food", experience: "Novice", user_id: 1}, {title: "Biking", type: "Sport", experience: "Intermediate", user_id: 1}, {title: "Coding", type: "Computer", experience: "Intermediate", user_id: 1}])
# User 2 Talents
Talent.create([{title: "Dancing", type: "Art & Music", experience: "Novice", user_id: 2}, {title: "Piano", type:"Art & Music", experience: "Novice", user_id: 2}])
# User 3 Talents
Talent.create([{title: "Gaming", type: "Sport", experience: "Expert", user_id: 3}, {title: "Coding", type: "Computer", experience: "Expert", user_id: 3}])

# User 1 Offers
Offer.create([{timeslot_id: rand(3..6), student_id: rand(2..3), status: [true, false].sample}])
# User 2 Offers
Offer.create([{timeslot_id:[1,2,5,6].sample, student_id:[1,3].sample, status: [true, false].sample}])
# User 3 Offers
Offer.create([{timeslot_id:rand(1..4), student_id: rand(1..2), status: [true, false].sample}])
