User.create!(name: "John Petrucci", email: "jhon@petrucci.com", password: "password", password_confirmation: "password")

99.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name, email: email, password: password, password_confirmation: password)
end

70.times do |n|
  title = Faker::Hipster.sentence
  body = Faker::Hipster.paragraph(3, true)
  user_id = Faker::Number.between(1, 70)
  ForumThread.create!(title: title, body: body, user_id: user_id)
end
