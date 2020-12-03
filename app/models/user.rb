class User < ActiveRecord::Base
    has_many :favorite_teams
    has_many :teams, through: :favorite_teams

    def users_in_my_city

    end

    def fellow_fans_in_my_city

    end

    def self.fair_weather

    end

    def fellow_fans(city)
        
    end

    
end
