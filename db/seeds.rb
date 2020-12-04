require_relative "../config/environment.rb"
city_names = {
    1=> "Phoenix",
    2=> "Atlanta",
    3=> "Baltimore",
    4=> "Buffalo",
    5=> "Charlotte",
    6=> "Chicago",
    7=> "Cincinnati",
    8=> "Cleveland",
    9=> "Dallas",
    10=> "Denver",
    11=> "Detroit",
    12 => "Green Bay",
    13=> "Houston",
    14=> "Indianapolis",
    15=> "Jacksonville",
    16 => "Kansas City",
    17=> "Los Angeles",
    18=> "Los Angeles",
    19 => "Las Vegas",
    20=> "Miami",
    21=> "Minneapolis",
    22 => "New England",
    23 => "New Orleans",
    24=> "New York",
    25=> "New York",
    26=> "Philadelphia",
    27=> "Pittsburgh",
    28=> "Seattle",
    29 => "San Francisco",
    30 => "Tamba Bay",
    31=> "Nashville",
    32=> "Washington D.C."
}

100.times do
    User.create(name:Faker::FunnyName.two_word_name, age:rand(1..100), city:city_names[rand(1..32)], motto:Faker::Movie.quote)
end

u1 = User.create(name: "Chap Stick", age: 55, city: "Los Angeles", motto: "Go big or go home!")
u2 = User.create(name: "Arti Fishal", age: 44, city: "Los Angeles", motto: "What time is it? GAME TIME!")
u3 = User.create(name: "Kay Oss", age: 33, city: "Los Angeles", motto: "WIN, WIN WIN WIN WIN")
u4 = User.creat(name: "Jim Nasium", age: 24, city: "Seattle", motto: "All day, baby. ALL DAY!")

f1 = FavoriteTeam.create(user_id: 102, team_id: 12)
f2 = FavoriteTeam.create(user_id: 103, team_id: 12)
f3 = FavoriteTeam.create(user_id: 104, team_id: 12)
f4 = FavoriteTeam.create(user_id: 105, team_id: 12)

32.times do |i|
    FavoriteTeam.new(user_id: rand(1..100), team_id:(i+1))
end

100.times do
    FavoriteTeam.create(user_id:rand(1..100), team_id:rand(1..32))
end




binding.pry