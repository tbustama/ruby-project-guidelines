class Team < ActiveRecord::Base
    has_many :favorite_teams
    has_many :users, through: :favorite_teams

    def self.most_liked_team
        team_name = Team.all.max_by{|team| team.favorite_teams.count}.name
        puts "The #{team_name.name} are the most liked team in the NFL!"
        team_name
    end

    def self.least_liked_team
        team_name = Team.all.min_by{|team| team.favorite_teams.count}
        puts "The #{team_name.name} are the least liked team in the NFL, someone call their marketing team..."
        team_name
    end

    def fan_average_age
        ages = self.users.sum{|user| user.age} / self.users.count
    end

    def self.oldest_fans
        old_team = Team.has_fans.max_by{|team| team.fan_average_age}
        puts "#{old_team.name} have the oldest fans with an average of #{old_team.fan_average_age} years old."
        old_team
    end

    def self.youngest_fans
        young_team = Team.has_fans.min_by{|team| team.fan_average_age}
        puts "#{young_team.name} have the youngest fans in the NFL. First 500 fans at the next game get a pacifier!"
        young_team
    end
    
    def self.top_scoring_team
        Team.all.max_by{|team| team.score}
    end

    def self.puts_top_scoring
        top_team = self.top_scoring_team
        puts "The #{top_team.name} are the top scoring team in the NFL. Get that offensive coordinator a raise!"
    end

    def self.worst_scoring_team
        Team.all.max_by{|team| team.score}
    end

    def self.puts_worst_scoring
        worst_team = self.worst_scoring_team
        puts "The #{worst_team.name} have the worst offense in the NFL. Taking bets on who gets fired first."
    end

    def self.most_points_allowed
        worst_team = Team.all.max_by{|team| team.opponent_score}
        puts "The Defensive Cordinator of the #{worst_team.name} needs to be fired."
        worst_team
    end

    def self.most_widespread_fanbase
        widespread = Team.all.max_by{|team| 
            team.users.map{|user| user.city}.uniq.count
        }
        puts "The #{widespread.name} fanbase is the most spread out of any other fanbase!"
        widespread
    end

    def self.has_fans
        Team.all.select{|team| team.users.count != 0}
    end

    def users_mottos
        mottos = self.users.map{|user| user.motto}
        if mottos != []
            puts "Here are your fans mottos:"
            mottos.each {|motto| print "#{motto} "}
        else  
            puts "You have no fans... your motto should be 'get some fans'"
        end
    end

    def self.top_team_mottos
        self.top_scoring_team.users_mottos
    end

    def self.worst_team_mottos
        self.worst_scoring_team.users_mottos
    end
end