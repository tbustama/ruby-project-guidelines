class User < ActiveRecord::Base
    has_many :favorite_teams
    has_many :teams, through: :favorite_teams

    def users_in_my_city
        User.fans(self.city).delete(self)
    end

    def fellow_fans_in_my_city
        self.users_in_my_city.select {|user| 
            self.fellow_fans.include?(user)
        }
    end

    def self.user_with_most_favorites
        self.all.max_by {|user|
            user.teams.count
        }
    end

    def self.fans(city)
        User.all.select{|user|
            user.city == city
        }
    end

    def fellow_fans
        User.all.find_all { |user|
            user.teams.any? { |team|
                self.teams.include?(team)
            }
        }.delete(self)
    end

    def fans_in_visiting_city(city)
        User.fans(city).select {|user|
            self.fellow_fans.include?(user)
        }
    end

    
end
