# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
    email: "a@a",
    password: "aaaaaa"
)

Genre.create!(
    name: "ケーキ"
)

item = Item.create!(
    genre_id: 1,
    name: "いちごのショートケーキ",
    explanation: "いちごのショートケーキです",
    price: 2500,
    is_sold: true
)

item.image.attach(io: File.open(Rails.root.join('app/assets/images/itigo.jpeg')), filename: 'itigo.jpeg')