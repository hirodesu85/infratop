# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Admin.create!(
#     email: "a@a",
#     password: "aaaaaa"
# )

Genre.create!(
    name: "クッキー"
)

item = Item.create!(
    genre_id: 13,
    name: "たまごプリン",
    introduction: "プリンです",
    price: 500,
    is_active: true
)

item.image.attach(io: File.open(Rails.root.join('app/assets/images/pudding.jpg')), filename: 'pudding.jpeg')