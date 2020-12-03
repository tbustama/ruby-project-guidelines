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

100.times do
    FavoriteTeam.create(user_id:rand(1..100), team_id:rand(1..32))
end




binding.pry