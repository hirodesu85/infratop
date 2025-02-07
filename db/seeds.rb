Customer.create!(
	email: "example@gmail.com",
	password: "foobar",
	last_name: "山田",
	first_name: "太郎",
	last_name_kana: "ヤマダ",
	first_name_kana: "タロウ",
	postal_code: "1234567",
	address: "東京都渋谷区",
	telephone_number: "09012345678"
)

Admin.create!(
  email: "a@a",
  password: "aaaaaa"
)

genres = %w[プリン ケーキ クッキー]

genres.each do |name|
  Genre.create!(name: name)
end

item = Genre.first.items.build(
	name: "チーズケーキ",
	introduction: "濃厚な味わい",
	price: 500
)
item.image.attach(io: File.open(Rails.root.join('app/assets/images/pudding.jpg')), filename: 'pudding.jpeg')

item.save!

