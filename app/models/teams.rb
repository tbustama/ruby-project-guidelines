class Teams < ActiveRecord::Base
    has_many :favorite_teams
    has_many :users, through: :favorite_teams

    def self.most_liked_team

    end

    def self.least_liked_team

    end

    def fan_average_age
        
    end

    def self.geriatrics

    end

    def self.daycare
        
    end
    
    def self.top_team

    end

    def self.worst_team

    end

    def self.division_leaders
    
    end
end