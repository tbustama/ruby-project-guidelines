class TeamController

    def initialize
        @team_data = GetRequest.new("https://api.sportsdata.io/v3/nfl/scores/json/TeamSeasonStats/2020?key=0ebd28730ddc4559bbd28014a59ad9b5").parse_json
    end

    def add_to_database
        Team.destroy_all
        city_names = {
            "ARI"=> "Arizona",
            "ATL"=> "Atlanta",
            "BAL"=> "Baltimore",
            "BUF"=> "Buffalo",
            "CAR"=> "Charlotte",
            "CHI"=> "Chicago",
            "CIN"=> "Cincinnati",
            "CLE"=> "Cleveland",
            "DAL"=> "Dallas",
            "DEN"=> "Denver",
            "DET"=> "Detroit",
            "GB" => "Green Bay",
            "HOU"=> "Houston",
            "IND"=> "Indianapolis",
            "JAX"=> "Jacksonville",
            "KC" => "Kansas City",
            "LAC"=> "Los Angeles",
            "LAR"=> "Los Angeles",
            "LV" => "Las Vegas",
            "MIA"=> "Miami",
            "MIN"=> "Minneapolis",
            "NE" => "New England",
            "NO" => "New Orleans",
            "NYG"=> "New York",
            "NYJ"=> "New York",
            "PHI"=> "Philadelphia",
            "PIT"=> "Pittsburgh",
            "SEA"=> "Seattle",
            "SF" => "San Francisco",
            "TB" => "Tamba Bay",
            "TEN"=> "Nashville",
            "WAS"=> "Washington D.C."
        }
        @team_data.each {|team_hash|
            arguments = {
                "team_name" => team_hash["TeamName"],
                "team" => city_names[team_hash["Team"]],
                "score" => team_hash["Score"],
                "opponent_score" => team_hash["OpponentScore"],
                "time_of_possession" => team_hash["TimeOfPossession"],
                "first_downs" => team_hash["FirstDowns"],
                "penalties" => team_hash["Penalties"],
                "fumbles" => team_hash["Fumbles"],
                "fumbles_forced" => team_hash["FumblesForced"],
                "passing_touchdowns" =>team_hash["PassingTouchdowns"],
                "rushing_touchdowns" => team_hash["RushingTouchdowns"],
                "sacks" => team_hash["Sacks"]
            }
            Team.create(arguments)
        }
    end

end
