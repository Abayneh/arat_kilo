
User.create!(email: "arat@email.com",
             password:              "foofoofoo",
             password_confirmation: "foofoofoo")

10.times do |n|
  email = "arat-#{n}@email.com"
  password  = "foofoofoo"
  password_confirmation = "foofoofoo"
  
  User.create!(email: email,
               password: password,
               password_confirmation: password_confirmation)
  end


Shop.create!(name: "Arat killo shop",
             description: "This is a description",
             address: "Arat Killo akabi",
             user_id: 1)

99.times do |n|
  name  = Faker::Name.name
  description = Faker::Lorem.sentence(5)
  address  = Faker::Lorem.sentence(1)
  user_id = n+1
  
  Shop.create!(name: name,
               description: description,
               address: address,
               user_id: user_id)
  end

