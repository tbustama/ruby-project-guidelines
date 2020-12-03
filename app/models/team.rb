class Team < ActiveRecord::Base
    has_many :favorite_teams
    has_many :users, through: :favorite_teams

    def self.most_liked_team
        Team.all.max_by{|team| team.favorite_teams.count}
    end

    def self.least_liked_team
        Team.all.min_by{|team| team.favorite_teams.count}
    end

    def fan_average_age
        self.users.sum{|user| user.age} / self.users.count
    end

    def self.oldest_fans
        Team.has_fans.max_by{|team| team.fan_average_age}
    end

    def self.youngest_fans
        Team.has_fans.min_by{|team| team.fan_average_age}
    end
    
    def self.top_scoring_team
        Team.all.max_by{|team| team.score}
    end

    def self.most_points_allowed
        Team.all.max_by{|team| team.opponent_score}
    end

    def self.most_widespread_fanbase
        Team.all.max_by{|team| 
            team.users.map{|user| user.city}.uniq.count
        }
    end

    def self.has_fans
        Team.all.select{|team| team.users.count != 0}
    end
end