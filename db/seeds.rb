# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

puts "Cleaning database..."
Experience.destroy_all
User.destroy_all

puts "Creating users..."
user_1 = {
  first_name: "Paul",
  last_name: "Domingos",
  email: "paul.domingos@gmail.com",
  dob: "1980-05-22",
  password: 123456
}
user_2 = {
  first_name: "Joana",
  last_name: "Figueira",
  email: "joana.figueira@gmail.com",
  dob: "1982-08-22",
  password: 123456
}

[user_1, user_2].each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.first_name}"
end

users = User.all

puts "Creating experiences..."
torel_swimming_pool = {
  title: "Torel Swimming Pool",
  description: "Free public pool in a garden with amazing view",
  location: "Jardim do Torel, Lisboa",
  price: 0,
  user: users.sample,
  url: "https://www.portugaldenorteasul.pt/uploads/20180227132800_miradourodojatdimdotorel.jpg"
}
sentido_proibido = {
  title: "Mojito at Sentido Proibido",
  description: "Nice and cheap mojito in Bairro Alto",
  location: "Rua da Atalaia, 34, Lisboa",
  price: 3,
  user: users.sample,
  url: "http://i0.wp.com/www.cookingupclean.com/wp-content/uploads/2014/09/mojito-2.jpg"
}
bolder = {
  title: "Bouldering in Ericeira",
  description: "Open air bouldering in Ericeira with a view",
  location: "Ribamar, Lisboa",
  price: 20,
  user: users.sample,
  url: "https://threerockbooks.com/wp/wp-content/uploads/2014/02/outdoor1.jpg"
}
jeep = {
  title: "Jeep Safari Tour",
  description: "Thrilling jeep safari tour for 2 people",
  location: "Rua Pé de Mouro, Sintra",
  price: 185,
  user: users.sample,
  url: "https://just-prod-assets.s3.ap-southeast-2.amazonaws.com/s3fs-public/styles/media_crop/public/2019-06/cn019_043jppr9ui22duu400kb3v10c3ji0c9.jpg?lZkcKOrnm.OzJ2YAFljAUnNr1gijg8Bu"
}

speedboat = {
  title: "Speedboat in Tagus River",
  description: "45 minutes Speedboat experience in Tagus river for a group of friends",
  location: "Doca de Santo Amaro, Lisboa",
  price: 50,
  user: users.sample,
  url: "https://www.raboattours.com/imagens/passeio-barco-speedboat-lisboa.jpg"
}

[torel_swimming_pool, sentido_proibido, jeep, bolder, speedboat].each do |attributes|
  experience = Experience.create!(title: attributes[:title], description: attributes[:description], location: attributes[:location],
                                  price: attributes[:price], user: attributes[:user])
  file = URI.open(attributes[:url])
  experience.photo.attach(io: file, filename: "experience.jpg", content_type: "image/jpg")

  puts "Created #{experience.title}"
end
puts "Finished!"
