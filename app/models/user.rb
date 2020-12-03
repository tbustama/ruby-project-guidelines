class User < ActiveRecord::Base
    has_many :favorite_teams
    has_many :teams, through: :favorite_teams

    def users_in_my_city
        users = User.users_in_city(self.city)
        users.delete(self)
        users
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

    def self.users_in_city(city)
        User.all.select{|user|
            user.city == city
        }
    end

    def fellow_fans
        users = User.all.find_all { |user|
            user.teams.any? { |team|
                self.teams.include?(team)
            }
        }
        users.delete(self)
        users
    end

    def fans_in_visiting_city(city)
        User.users_in_city(city).select {|user|
            self.fellow_fans.include?(user)
        }
    end

    def self.oldest_user
        self.all.max_by{|user| user.age}
    end

    def self.youngest_user
        self.all.min_by{|user| user.age}
    end

    
end
