require 'faker'

# Generate Users
100.times do
  User.new(email: Faker::Internet.email, password: "deadline1312").save
end

# Generate Hitmen
30.times do
  methods = ["Strangle", "Poison", "Close & Personal", "Sniper", "\"Accident\""]
  Hitman.new(
    user: User.all.sample,
    method: methods.sample,
    name: Faker::TvShows::RuPaul.queen,
    location: Faker::Address.community,
    bio: Faker::Books::Lovecraft.sentences.join(' ')
  ).save
end

# Generate various completed jobs
100.times do
  user = User.all.sample
  hitman = Hitman.all.sample
  Job.new(
    details: "Please kill #{Faker::FunnyName.three_word_name}! 😇 thaaaaaaanks ✌️🤪🫶",
    deadline: Faker::Date.backward(days: 365),
    user: user,
    hitman: hitman,
    location: Faker::Address.full_address,
    price: Faker::Number.between(from: 1000.0, to: 1000000.0).floor(2),
    completed: true,
    accepted: true,
    paid: (rand(2) == 1),
    review: Faker::TvShows::TwinPeaks.quote,
    rating: Faker::Number.between(from: 0, to: 5).floor
  ).save
end

# Generate Uncompleted Unaccepted Jobs
50.times do
  user = User.all.sample
  hitman = Hitman.all.sample
  Job.new(
    details: "Please kill #{Faker::FunnyName.three_word_name}! 😇 thaaaaaaanks ✌️🤪🫶",
    deadline: Faker::Date.forward(days: 365),
    user: user,
    hitman: hitman,
    location: Faker::Address.full_address,
    price: Faker::Number.between(from: 1000.0, to: 1000000.0).floor(2),
  ).save
end

# Generate Uncompleted Accepted Jobs
50.times do
  user = User.all.sample
  hitman = Hitman.all.sample
  Job.new(
    details: "Please kill #{Faker::FunnyName.three_word_name}! 😇 thaaaaaaanks ✌️🤪🫶",
    deadline: Faker::Date.forward(days: 365),
    user: user,
    hitman: hitman,
    location: Faker::Address.full_address,
    price: Faker::Number.between(from: 1000.0, to: 1000000.0).floor(2),
    accepted: true
  ).save
end

# Generate Fuckload of Messages
1000.times do
  job = Job.all.sample
  users = [job.hitman.user, job.user]
  Message.new(
    job: job,
    user: users.sample,
    content: Faker::TvShows::Spongebob.quote
  ).save
end
