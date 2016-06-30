
User.create!(email: "admin@aratkilo.com",
             password:              "foofoofoo",
             password_confirmation: "foofoofoo",
             admin: true)

10.times do |n|
  email = "email-#{n}@aratkilo.com"
  password  = "foofoofoo"
  password_confirmation = "foofoofoo"
  
  User.create!(email: email,
               password: password,
               password_confirmation: password_confirmation,
               admin: false)
  end


Shop.create!(name: "Nuru Electronics",
             description: "All types of electronics here...",
             address: "Merkato, Raguel Bld, 4th floor, #21",
             user_id: 1)

20.times do |n|
  name  = "Shop Number #{n}"
  description = Faker::Lorem.sentence(5)
  address  = "Merkato Raguel Bld, Room #{n}"
  user_id = n+1
  
  Shop.create!(name: name,
               description: description,
               address: address,
               user_id: user_id)
  end


# 10.times do |n|
#     name= "Samsung Galaxy S7M-#{n+500}"
#     category = "Electronics"
#     price = 10000+n*100
#     discount = false
#     soldout = false
#     shop_id = 1
    
#   Item.create!(name: name,
#               category: category,
#               price: price,
#               discount: discount,
#               soldout: soldout,
#               shop_id: shop_id)
# end
               
# 10.times do |n|
#     name= "TECNO Mobile XPZ-#{n}"
#     category = "Electronics"
#     price = 10000+n*100
#     discount = false
#     soldout = false
#     shop_id = 2
    
#   Item.create!(name: name,
#               category: category,
#               price: price,
#               discount: discount,
#               soldout: soldout,
#               shop_id: shop_id)
# end
