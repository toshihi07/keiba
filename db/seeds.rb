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

["単勝","復勝","枠連","馬連","馬単","ワイド","3連複","3連複"]
.each do |name|
  Category.create!(
    {name: name}
  )
end

[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]
.each do |number|
  HorseNumber.create!(
    {number: number}
  )
end



