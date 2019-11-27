# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
["1R","2R","3R","4R","5R","6R","7R","8R","9R","10R","11R","12R"]
.each do |number|
  RaceNumber.create!(
    {number: number}
  )
end

["東京","中山","京都","阪神","中京","札幌","函館","福島","新潟","小倉"]
.each do |name|
  RaceCourse.create!(
    {name: name}
  )
end

["1番","2番","3番","4番","5番","6番","7番","8番","9番","10番","11番","12番","13番","14番","15番","16番","17番","18番"]
.each do |number|
  HorseNumber.create!(
    {number: number}
  )
end

# 単勝
win = Category.create(name: "単勝")
win_1 = win.children.create(name: "通常")

# 複勝
place = Category.create(name: " 複勝")
place_1= place.children.create(name: "通常")

# 枠連
bracket_quinella = Category.create(name: "枠連")
bracket_quinella_1= bracket_quinella.children.create(name: "通常")
bracket_quinella_2= bracket_quinella.children.create(name: "ボックス")
bracket_quinella_3= bracket_quinella.children.create(name: "ながし")


# 馬連
quinella = Category.create(name: "馬連")
quinella_1= quinella.children.create(name: "通常")
quinella_2= quinella.children.create(name: "ボックス")
quinella_3= quinella.children.create(name: "ながし")

# 馬単
exacta = Category.create(name: "馬単")
exacta_1= exacta.children.create(name: "通常")
exacta_2= exacta.children.create(name: "ボックス")
exacta_3= exacta.children.create(name: "1着ながし")
exacta_3= exacta.children.create(name: "2着ながし")

# ワイド
quinella_place = Category.create(name: "ワイド")
quinella_place_1= quinella_place.children.create(name: "通常")
quinella_place_2= quinella_place.children.create(name: "ボックス")
quinella_place_3= quinella_place.children.create(name: "ながし")




