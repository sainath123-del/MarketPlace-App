
User.destroy_all
Product.destroy_all
Brand.destroy_all
Order.destroy_all
puts 'Deleted data'

# User.create(name: 'Ajay',
#     email: 'Ajay@gmail.com',
#     passsword: 'ajay')
# User.create(name:'Ash',
#     email: 'Ash@gmail.com',
#     passsword:'ajay')
# User.create(name: 'akash',
#     email: 'Akash@gmail.com',
#     passsword: 'ajay')
# User.create(name: 'yash',
#     email: 'Yash@gmail.com',
#      passsword:'ajay')

# puts 'User Created'

# Brand.create(name: "MRF")
# Brand.create(name: "NB")
# Brand.create(name:"CEAT")
# Brand.create(name: "Adidas")
4.times do  |i|
   brand = Brand.create(name: "Brand#{i}")
   5.times do 
    brand.products.create(name: 'Bat',
        
    description: 'This is awesome bat',
price: 100
)
    end

end 
# puts 'brand and products'

# rating_array = [{text: 'Awesome', rating: 5},
#     {text: 'Pretty good',rating:4},
#     {text: 'Good', rating: 3},
#     {text: 'Not bad', rating: 2},
#     {text: 'Bad', rating: 1},
#     {text: 'Zero', rating: 0}
# ]
# 20.times do
#     current_rating = rating_array.sample
#     Rating.create(review: current_rating[:text], 
#     rating: current_rating[:rating],
#     user:User.all.sample,
#     product:Product.all.sample)
#     end
# puts 'rating update'
