class User < ActiveRecord::Base
    has_many :favorite_teams
    has_many :teams, through: :favorite_teams

    def users_in_my_city
        User.all.select{|user|
            user.city == self.city
        }
    end

    def fellow_fans_in_my_city
        self.users_in_my_city.select { |user|
            user.teams.any? { |team|
                self.teams.include?(team)
            }
        }
    end

    def self.fair_weather

    end

    def fellow_fans(city)
        
    end

    
end
