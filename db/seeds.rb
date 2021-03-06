# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all
Order.destroy_all
OrderItem.destroy_all
User.destroy_all
Account.destroy_all

10.times do |index|
  Product.create!(
    name: Faker::Coffee.blend_name,
    price: Faker::Number.decimal(2, 2),
    description: Faker::Lorem.sentence(4),
    stock: Faker::Number.between(1, 20),
    image: open('public/images/viognier.jpg')
  )
end

admin = User.create!(
  email: 'admin@email.com',
  password: 'asdfasdf',
  password_confirmation: 'asdfasdf',
  admin: true
)
