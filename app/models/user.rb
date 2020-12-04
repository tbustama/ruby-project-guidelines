class User < ActiveRecord::Base
    has_many :favorite_teams
    has_many :teams, through: :favorite_teams

    def users_in_my_city
        users = User.users_in_city(self.city)
        users.delete(self)
        users
    end

    def print_users_in_my_city
        users = self.users_in_my_city
        puts "These are the names of people in your city:"
        users.each{|user| 
            print user.name
            if users.last != user 
                print ", "
            end
        }
        print "\n"
    end

    def fellow_fans_in_my_city
        fellow_fans = self.users_in_my_city.select {|user| 
            self.fellow_fans.include?(user)
        }
        if fellow_fans == nil
            puts "Sorry your alone on this one."
        else 
            puts "You've found your people!"
            fellow_fans.each{|fan| 
            print fan.name
            if fellow_fans.last != fan 
                print ", "
            end
        }
        print "\n"
        fellow_fans
        end
    end

    def self.user_with_most_favorites
        bandwagon = self.all.max_by {|user|
            user.teams.count
        }.name
        puts "Always a winner when you're on the bandwagon. Right, #{bandwagon}?"
    end

    def self.users_in_city(city)
        # User.all.select{|user|
        #     user.city == city
        # }
        User.where("city": city)
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
        fans = User.users_in_city(city).select {|user|
            self.fellow_fans.include?(user)
        }
        if fans.count == 0
            puts "Looks like you'll have to start your own fanbase"
        else 
            puts "New in town? Get together with your fellow fans and cheer!"
            fans.each{|fan| 
            print fan.name
            if fans.last != fan 
                print ", "
            end
        }
        print "\n"
        fans
        end
    end

    def self.oldest_user
        # oldest = self.all.max_by{|user| user.age}.name
        oldest = User.where(age: User.maximum("age"))[0].name
        puts "The award for the most trips around the sun goes to #{oldest}!"
    end

    def self.youngest_user
        # youngest = self.all.min_by{|user| user.age}.name
        youngest = User.where(age: User.minimum("age"))[0].name
        puts "The Golden Pacifier goes to #{youngest}!"
    end

    
end
