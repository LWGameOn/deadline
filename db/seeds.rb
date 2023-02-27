require 'faker'

100.times do
  User.new(email: Faker::Internet.email, password: Faker::Internet.password)
end

30.times do
  num = rand(100)
  methods = ["Strangle", "Poison", "Close & Personal", "Sniper", "\"Accident\""]
  Hitman.new(
    user: User.find(num),
    method: methods.sample,
    name: Faker::TvShows::RuPaul.queen,
    location: Faker::Address.community,
    bio: Faker::Books::Lovecraft.sentences
  )
end

# todo generate jobs
