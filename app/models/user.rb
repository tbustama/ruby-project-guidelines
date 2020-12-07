class User < ActiveRecord::Base
    has_many :favorite_teams
    has_many :teams, through: :favorite_teams

    def users_in_my_city
        users = User.users_in_city(self.city)
        users.select{|user| user != self}
    end

    def print_users_in_my_city
        users = self.users_in_my_city
        puts "These are the names of people in your city:".red
        users.each{|user| 
            print "#{user.name}".red
            if users.last != user 
                print ", ".red
            end
        }
        print "\n"
    end

    def fellow_fans_in_my_city
        fellow_fans = self.users_in_my_city.select {|user| 
            self.fellow_fans.include?(user)
        }
        if fellow_fans.count == 0
            puts "Sorry you're alone on this one.".red
        else 
            puts "You've found your people!".red
            fellow_fans.each{ |fan| 
                print "#{fan.name}".red
                if fellow_fans.last != fan 
                    print ", ".red
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
        puts "Always a winner when you're on the bandwagon. Right, #{bandwagon}?".red
    end

    def self.users_in_city(city)
        User.where("city": city)
    end

    # efficiency refactor on this method
    def fellow_fans
        teams = self.teams
        users = User.all.find_all { |user|
            user.teams.any? { |team|
                teams.include?(team)
            }
        }
        users.select{|user| user != self}
    end

    def fans_in_visiting_city(city)
        fans = User.users_in_city(city).select {|user|
            self.fellow_fans.include?(user)
        }
        if fans.count == 0
            puts "Looks like you'll have to start your own fanbase".red
        else 
            puts "New in town? Get together with your fellow fans and cheer!".red
            fans.each{|fan| 
            print "#{fan.name}".red
            if fans.last != fan 
                print ", ".red
            end
        }
        print "\n"
        fans
        end
    end

    def self.oldest_user
        oldest = User.where(age: User.maximum("age"))[0].name
        puts "The award for the most trips around the sun goes to #{oldest}!".red
    end

    def self.youngest_user
        youngest = User.where(age: User.minimum("age"))[0].name
        puts "The Golden Pacifier goes to #{youngest}!".red
    end

    def favorite_teams_cities
        self.teams.each { |team| 
            puts "Cities for fans of team: #{team.name}".red
            city_array = team.user_cities
            city_array.each { |city| 
                if city != city_array.last
                    print "#{city}, ".red
                elsif
                    puts "#{city}".red
                end
            }
        }
    end
end
