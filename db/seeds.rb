require 'faker'
require 'open-uri'
# Generate Users
100.times do
  User.new(email: Faker::Internet.email, password: "deadline1312").save
end

#attach images to hitmans after 15th duplicated photos

url = ["https://www.wkbn.com/wp-content/uploads/sites/48/2023/02/joshua-vigorito-mugshot-counterfeiting-theft-charges-niles.jpg?w=1280",
        "https://bloximages.chicago2.vip.townnews.com/wcfcourier.com/content/tncms/assets/v3/editorial/5/08/5088b0cc-b231-536d-bdaa-7cd149667de1/5d4db0a7d47de.image.jpg",
        "https://static.independent.co.uk/2022/03/11/16/Screen%20Shot%202022-03-11%20at%2011.29.09%20AM.png?width=1200",
        "https://metro.co.uk/wp-content/uploads/2013/10/sd10.jpg?quality=90&strip=all&zoom=1&resize=480%2C643",
        "https://www.thesmokinggun.com/sites/default/files/assets/michiganhairmiss21.jpg",
        "https://www.thesun.co.uk/wp-content/uploads/2019/10/NINTCHDBPICT000535085906.jpg",
        "https://www.wiproud.com/wp-content/uploads/sites/46/2020/10/PETE.jpg?w=480",
        "https://metro.co.uk/wp-content/uploads/2014/06/ad_138404366-e1403272967765.jpg?quality=90&strip=all&zoom=1&resize=480%2C594",
        "https://www.teamjimmyjoe.com/wp-content/uploads/2012/11/Funny-Mug-Shots-fat-neck.jpg",
        "https://cdn.abcotvs.com/dip/images/125166_jailedonstatewarrant.jpg",
        "https://www.intouchweekly.com/wp-content/uploads/2018/03/jacqueline-wells.jpg?resize=1200%2C1200&quality=86&strip=all",
        "https://imgix.ranker.com/user_node_img/50049/1000977398/original/boys-don-t-cry-photo-u1?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&w=375",
        "https://www.thesun.co.uk/wp-content/uploads/2018/09/NINTCHDBPICT000437528984.jpg",
        "https://d2r8r0qhs4bt8m.cloudfront.net/wp-content/uploads/2019/10/18174401/desktop-1406690125.png",
        "https://external-preview.redd.it/dRT5wJgsEEWojfaz4ZDsrxAMZ7V9cMGErqhiMDQ4QbE.jpg?auto=webp&s=1f409ae6eff992ae40be6cf16644442c2f2ba740",
        "https://www.wkbn.com/wp-content/uploads/sites/48/2023/02/joshua-vigorito-mugshot-counterfeiting-theft-charges-niles.jpg?w=1280",
        "https://bloximages.chicago2.vip.townnews.com/wcfcourier.com/content/tncms/assets/v3/editorial/5/08/5088b0cc-b231-536d-bdaa-7cd149667de1/5d4db0a7d47de.image.jpg",
        "https://static.independent.co.uk/2022/03/11/16/Screen%20Shot%202022-03-11%20at%2011.29.09%20AM.png?width=1200",
        "https://metro.co.uk/wp-content/uploads/2013/10/sd10.jpg?quality=90&strip=all&zoom=1&resize=480%2C643",
        "https://www.thesmokinggun.com/sites/default/files/assets/michiganhairmiss21.jpg",
        "https://www.thesun.co.uk/wp-content/uploads/2019/10/NINTCHDBPICT000535085906.jpg",
        "https://www.wiproud.com/wp-content/uploads/sites/46/2020/10/PETE.jpg?w=480",
        "https://metro.co.uk/wp-content/uploads/2014/06/ad_138404366-e1403272967765.jpg?quality=90&strip=all&zoom=1&resize=480%2C594",
        "https://www.teamjimmyjoe.com/wp-content/uploads/2012/11/Funny-Mug-Shots-fat-neck.jpg",
        "https://cdn.abcotvs.com/dip/images/125166_jailedonstatewarrant.jpg",
        "https://www.intouchweekly.com/wp-content/uploads/2018/03/jacqueline-wells.jpg?resize=1200%2C1200&quality=86&strip=all",
        "https://imgix.ranker.com/user_node_img/50049/1000977398/original/boys-don-t-cry-photo-u1?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&w=375",
        "https://www.thesun.co.uk/wp-content/uploads/2018/09/NINTCHDBPICT000437528984.jpg",
        "https://d2r8r0qhs4bt8m.cloudfront.net/wp-content/uploads/2019/10/18174401/desktop-1406690125.png",
        "https://external-preview.redd.it/dRT5wJgsEEWojfaz4ZDsrxAMZ7V9cMGErqhiMDQ4QbE.jpg?auto=webp&s=1f409ae6eff992ae40be6cf16644442c2f2ba740",
       ]

# Generate Hitmen
30.times do
  methods = ["Strangle", "Poison", "Close & Personal", "Sniper", "\"Accident\""]
  Hitman.new(
    user: User.all.sample,
    method: methods.sample,
    name: Faker::TvShows::RuPaul.queen,
    location: Faker::Address.community,
    bio: Faker::TvShows::Community.quotes
  ).save
end

i = 1
30.times do
  image = URI.open(url.sample)
  hitman = Hitman.find(i)
  hitman.photo.attach(io: image, filename: "hitman.jpg", content_type: "image/jpg")
  i += 1
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
