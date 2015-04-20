usernames = ["notika", "ben", "ryan", "lauren", "steph", "angel", "eveanandi", "tracy", "kevin", "hoa", "sam", "kiran", "ryanB", "malcolm"]
emails = ["notika@gmail.com", "ben@gmail.com", "ryan@gmail.com", "lauren@gmail.com", "steph@gmail.com", "angel@gmail.com", "eveanandi@gmail.com", "tracy@gmail.com", "kevin@gmail.com", "hoa@gmail.com", "sam@gmail.com", "kiran@gmail.com", "ryanB@gmail.com", "malcolm@gmail.com"]
locations = ["28 MC Cabe St, NYC", "234 Wall St, Islip", "160 Essex St, NYC", "2 Hello St, NYC", "456 Floor St, Smithtown", "160 Essex St NYC", "NYC, 18 MC Cabe St", "999 Wall St, Stony Brook", "160 Essex St, NYC", "8 MC Cabe St, NYC", "234 Wall St, Rockville Center", "140 Essex St, NYC","8 MC Cabe St, NYC", "9 Wall St, Carle Place"]
interests = ["Guitar playing", "dance", "coding", "cooking", "biking", "eating","Guitar playing", "dance", "coding", "cooking", "biking", "eating","Guitar playing", "dance", "coding", "cooking", "biking", "eating"]
about = ["I like short walks on the beach, long bikes on the road, and drinking anything but pina coladas in the rain.", "I code, I eat, I conquer. But I also play piano, dance, and I want to learn endlessly.", "I can't think. I need food. I'm expert in everything though. Hit me up.","I like short walks on the beach, long bikes on the road, and drinking anything but pina coladas in the rain.", "I code, I eat, I conquer. But I also play piano, dance, and I want to learn endlessly.", "I can't think. I need food. I'm expert in everything though. Hit me up.","I like short walks on the beach, long bikes on the road, and drinking anything but pina coladas in the rain.", "I code, I eat, I conquer. But I also play piano, dance, and I want to learn endlessly.", "I can't think. I need food. I'm expert in everything though. Hit me up.","I like short walks on the beach, long bikes on the road, and drinking anything but pina coladas in the rain.", "I code, I eat, I conquer. But I also play piano, dance, and I want to learn endlessly."]

14.times do |i|
  user = User.create(username: usernames[i], email: emails[i], location: locations[i], interests: interests[i], password: "123", about: about[i])
  8.times do |i|
    user.timeslots << Timeslot.create(time: DateTime.new(2014,4,rand(13..19),rand(1..11)), user_id: user.id)
  end
end

natalia = User.first
ryan = User.all[1]
ben = User.all[2]
lauren = User.all[3]
steph = User.all[4]
angel = User.all[5]
eveanandi = User.all[6]
tracy = User.all[7]
kevin = User.all[8]
hoa = User.all[9]
sam = User.all[10]
kiran = User.all[11]
ryanB = User.all[12]
malcolm = User.all[13]

5.times do |i|
  natalia.reputations << Reputation.create!(judge_id: [2,3,4,5,6,7,8,9,10,11,12,13,14].sample, rating: [1,2,3,4,5].sample)
  ryan.reputations << Reputation.create!(judge_id: [1,3,4,5,6,7,8,9,10,11,12,13,14].sample, rating: [1,2,3,4,5].sample)
  ben.reputations << Reputation.create!(judge_id: [1,2,4,5,6,7,8,9,10,11,12,13,14].sample, rating: [1,2,3,4,5].sample)
  lauren.reputations << Reputation.create!(judge_id: [1,2,3,5,6,7,8,9,10,11,12,13,14].sample, rating: [1,2,3,4,5].sample)
  steph.reputations << Reputation.create!(judge_id: [1,2,3,4,6,7,8,9,10,11,12,13,14].sample, rating: [1,2,3,4,5].sample)
  angel.reputations << Reputation.create!(judge_id: [1,2,3,4,5,7,8,9,10,11,12,13,14].sample, rating: [1,2,3,4,5].sample)
  eveanandi.reputations << Reputation.create!(judge_id: [1,2,3,4,5,6,8,9,10,11,12,13,14].sample, rating: [1,2,3,4,5].sample)
  tracy.reputations << Reputation.create!(judge_id: [1,2,3,4,5,6,7,9,10,11,12,13,14].sample, rating: [1,2,3,4,5].sample)
  kevin.reputations << Reputation.create!(judge_id: [1,2,3,4,5,6,7,8,10,11,12,13,14].sample, rating: [1,2,3,4,5].sample)
  hoa.reputations << Reputation.create!(judge_id: [1,2,3,4,5,6,7,8,9,11,12,13,14].sample, rating: [1,2,3,4,5].sample)
  sam.reputations << Reputation.create!(judge_id: [1,2,3,4,5,6,7,8,9,10,12,13,14].sample, rating: [1,2,3,4,5].sample)
  kiran.reputations << Reputation.create!(judge_id: [1,2,3,4,5,6,7,8,9,10,11,13,14].sample, rating: [1,2,3,4,5].sample)
  ryanB.reputations << Reputation.create!(judge_id: [1,2,3,4,5,6,7,8,9,10,11,12,14].sample, rating: [1,2,3,4,5].sample)
  malcolm.reputations << Reputation.create!(judge_id: [1,2,3,4,5,6,7,8,9,10,11,12,13].sample, rating: [1,2,3,4,5].sample)

end

Talent.create([{title: "Hip-hop dance", type: "artMusic", experience: "novice", user_id: 1}, {title: "Swing dance", type: "artMusic", experience: "novice", user_id: 1}, {title: "Baking Bread", type: "food", experience: "novice", user_id: 1}, {title: "Ruby - Coding", type: "compEle", experience: "novice", user_id: 1}])
# User 2 Talents
Talent.create([{title: "Ruby on Rails - Coding", type: "compEle", experience: "expert", user_id: 2}, {title: "Minesweeper", type: "compEle", experience: "expert", user_id: 2}, {title: "Learn Chinese", type: "educareer", experience: "expert", user_id: 2}])
# User 3 Talents
Talent.create([{title: "Baseball", type: "sport", experience: "expert", user_id: 3}, {title: "PHP - Coding", type: "compEle", experience: "intermediate", user_id: 3}, {title: "Piano", type: "artMusic", experience: "expert", user_id: 3}])
# User 4 Talents
Talent.create([{title: "Destiny - Gaming", type: "compEle", experience: "novice", user_id: 4}, {title: "Physics Tutoring", type: "educareer", experience: "intermediate", user_id: 4}, {title: "Boxing", type: "sport", experience: "novice", user_id: 4}, {title: "Chemistry Tutoring", type: "educareer", experience: "novice", user_id: 4}])
# User 5 Talents
Talent.create([{title: "Snowboarding", type: "sport", experience: "expert", user_id: 5}, {title: "Sewing", type: "artMusic", experience: "expert", user_id: 5}, {title: "Pencil Sketching", type: "artMusic", experience: "intermediate", user_id: 5}, {title: "Fix your doors", type: "homeImp", experience: "novice", user_id: 5}, {title: "Cardio", type: "nuFit", experience: "intermediate", user_id: 5}])
# User 6 Talents
Talent.create([{title: "Ballet", type: "artMusic", experience: "expert", user_id: 6}, {title: "Singing", type: "artMusic", experience: "novice", user_id: 6}, {title: "Table Tennis", type: "sport", experience: "intermediate", user_id: 6}, {title: "Korean Dishes", type: "food", experience: "intermediate", user_id: 6}])
# User 7 Talents
Talent.create([{title: "Presenting Dishes", type: "food", experience: "intermediate", user_id: 7}, {title: "World of Warcraft - Gaming", type: "compEle", experience: "novice", user_id: 7}, {title: "Baking Cakes", type: "food", experience: "expert", user_id: 7}])
# User 8 Talents
Talent.create([{title: "Cardio", type: "nuFit", experience: "intermediate", user_id: 8}, {title: "Basketball", type: "sport", experience: "intermediate", user_id: 8}, {title: "Italian Dishes", type: "food", experience: "novice", user_id: 8}, {title: "Ruby on Rails - Coding", type: "compEle", experience: "expert", user_id: 8}, {title: "Flute", type: "artMusic", experience: "intermediate", user_id: 8} ])
# User 9 Talents
Talent.create([{title: "How to Make Friends and Influence People", type: "educareer", experience: "expert", user_id:9 }, {title: "Bodybuilding", type: "nuFit", experience: "expert", user_id: 9}, {title: "Saxophone", type: "artMusic", experience: "intermediate", user_id: 9}])
# User 10 Talents
Talent.create([{title: "Vietnamese Dishes", type: "food", experience: "expert", user_id: 10}, {title: "Career Advice and Guidance", type: "educareer", experience: "novice", user_id: 10}, {title: "Cooking Halal Food", type: "food", experience: "expert", user_id: 10}, {title: "Making Desserts", type: "food", experience: "novice", user_id: 10}, {title: "Minesweeper", type: "compEle", experience: "expert", user_id: 10}])
# User 11 Talents
Talent.create([{title: "Grand Theft Auto", type: "compEle", experience: "expert", user_id: 11}, {title: "Chinese Dishes", type: "food", experience: "intermediate", user_id: 11}, {title: "Math Tutoring", type: "educareer", experience: "intermediate", user_id: 11}])
# User 12 Talents
Talent.create([{title: "Baseball", type: "sport", experience: "expert", user_id: 12}, {title: "Billards - Pool", type: "sport", experience: "novice", user_id: 12}, {title: "Soccer", type: "sport", experience: "expert", user_id: 12}, {title: "Fix your sink", type: "homeImp", experience: "intermediate", user_id: 12}, {title: "Fix your heater", type: "homeImp", experience: "expert", user_id: 12}, {title: "Become bob the builder", type: "homeImp", experience: "intermediate", user_id:12}])
# User 13 Talents
Talent.create([{title: "How to Make Friends and Influence People", type: "educareer", experience: "expert", user_id: 13}, {title: "Singing", type: "artMusic", experience: "novice", user_id: 13}, {title: "Physics Tutoring", type: "educareer", experience: "intermediate", user_id: 13}, {title: "Destiny", type: "compEle", experience: "intermediate", user_id: 13}])
# User 14 Talents
Talent.create([{title: "Hip-hop dance", type: "artMusic", experience: "novice", user_id: 14}, {title: "Sewing", type: "artMusic", experience: "expert", user_id: 14}, {title: "Boxing", type: "sport", experience: "expert", user_id: 14}, {title: "Minesweeper", type: "compEle", experience: "intermediate", user_id: 14}])

# User 1 Offers
4.times do
   Offer.create([{timeslot_id: rand(1..8), student_id: [2,3,4,5,6,7,8,9,10,11,12,13,14].sample, status: false}])
 end
 Offer.create([{timeslot_id: rand(1..8), student_id: [2,3,4,5,6,7,8,9,10,11,12,13,14].sample, status: true}])
# User 2 Offers
4.times do
  Offer.create([{timeslot_id: rand(9..16), student_id: [1,3,4,5,6,7,8,9,10,11,12,13,14].sample, status: false}])
end
Offer.create([{timeslot_id: rand(9..16), student_id: [1,3,4,5,6,7,8,9,10,11,12,13,14].sample, status: true}])
# User 3 Offers
4.times do
  Offer.create([{timeslot_id: rand(17..24), student_id: [1,2,4,5,6,7,8,9,10,11,12,13,14].sample, status: false}])
end
Offer.create([{timeslot_id: rand(17..24), student_id: [1,2,4,5,6,7,8,9,10,11,12,13,14].sample, status: true}])
# User 4 Offers
4.times do
  Offer.create([{timeslot_id: rand(25..32), student_id: [1,2,3,5,6,7,8,9,10,11,12,13,14].sample, status: false}])
end
Offer.create([{timeslot_id: rand(25..32), student_id: [1,2,3,5,6,7,8,9,10,11,12,13,14].sample, status: true}])
# User 5 Offers
4.times do
  Offer.create([{timeslot_id: rand(33..40), student_id: [1,2,3,4,6,7,8,9,10,11,12,13,14].sample, status: false}])
end
Offer.create([{timeslot_id: rand(33..40), student_id: [1,2,3,4,6,7,8,9,10,11,12,13,14].sample, status: true}])
# User 6 Offers
4.times do
  Offer.create([{timeslot_id: rand(41..48), student_id: [1,2,3,4,5,7,8,9,10,11,12,13,14].sample, status: false}])
end
Offer.create([{timeslot_id: rand(41..48), student_id: [1,2,3,4,5,7,8,9,10,11,12,13,14].sample, status: true}])
# User 7 Offers
4.times do
  Offer.create([{timeslot_id: rand(49..56), student_id: [1,2,3,4,5,6,8,9,10,11,12,13,14].sample, status: false}])
end
Offer.create([{timeslot_id: rand(49..56), student_id: [1,2,3,4,5,6,8,9,10,11,12,13,14].sample, status: true}])
# User 8 Offers
4.times do
  Offer.create([{timeslot_id: rand(57..64), student_id: [1,2,3,4,5,6,7,9,10,11,12,13,14].sample, status: false}])
end
Offer.create([{timeslot_id: rand(57..64), student_id: [1,2,3,4,5,6,7,9,10,11,12,13,14].sample, status: true}])
# User 9 Offers
4.times do
  Offer.create([{timeslot_id: rand(65..72), student_id: [1,2,3,4,5,6,7,8,10,11,12,13,14].sample, status: false}])
end
Offer.create([{timeslot_id: rand(65..72), student_id: [1,2,3,4,5,6,7,8,10,11,12,13,14].sample, status: true}])
# User 10 Offers
4.times do
  Offer.create([{timeslot_id: rand(73..80), student_id: [1,2,3,4,5,6,7,8,9,11,12,13,14].sample, status: false}])
end
Offer.create([{timeslot_id: rand(73..80), student_id: [1,2,3,4,5,6,7,8,9,11,12,13,14].sample, status: true}])
# User 11 Offers
4.times do
  Offer.create([{timeslot_id: rand(81..88), student_id: [1,2,3,4,5,6,7,8,9,10,12,13,14].sample, status: false}])
end
Offer.create([{timeslot_id: rand(81..88), student_id: [1,2,3,4,5,6,7,8,9,10,12,13,14].sample, status: true}])
# User 12 Offers
4.times do
  Offer.create([{timeslot_id: rand(89..96), student_id: [1,2,3,4,5,6,7,8,9,10,11,13,14].sample, status: false}])
end
Offer.create([{timeslot_id: rand(89..96), student_id: [1,2,3,4,5,6,7,8,9,10,11,13,14].sample, status: true}])
# User 13 Offers
4.times do
  Offer.create([{timeslot_id: rand(97..104), student_id: [1,2,3,4,5,6,7,8,9,10,11,12,14].sample, status: false}])
end
Offer.create([{timeslot_id: rand(97..104), student_id: [1,2,3,4,5,6,7,8,9,10,11,12,14].sample, status: true}])
# User 14 Offers
4.times do
  Offer.create([{timeslot_id: rand(105..112), student_id: [1,2,3,4,5,6,7,8,9,10,11,12,13].sample, status: false}])
end
Offer.create([{timeslot_id: rand(105..112), student_id: [1,2,3,4,5,6,7,8,9,10,11,12,13].sample, status: true}])
