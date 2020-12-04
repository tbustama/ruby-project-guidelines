class Menu
    # starts the menu, this will be the first/only thing 
    # that needs to be called on the instance    
    @@user = nil
    @@user_favorites = []
    def start
        puts " ----------------------------------------------------"
        puts "| Welcome to the Fantastic Football Favorites, FFF's!|"
        puts " ----------------------------------------------------"
        puts "| Would you like to create an account?               |"
        puts "| Enter '1' to create an account                     |"
        puts "| Enter '2' to exit                                  |"
        self.create_account_choice
    end

    # takes in the user input and calls the create account method 
    # if they want to create an account
    def create_account_choice
        user_input = STDIN.gets.chomp
        user_input == "1" ? self.create_account : return
    end

    # grabs user input to create an account and sends them to display commands
    def create_account
        puts " ----------------------------------------------------"
        puts "| Thank you for creating an account!                 |"
        puts "| Please enter your name below:                      |"
        user_name = STDIN.gets.chomp
        puts " ----------------------------------------------------"
        puts "| Please enter your age below:                       |"
        user_age = STDIN.gets.chomp
        user_age = user_age.to_i
        puts " ----------------------------------------------------"
        puts "| Please enter the city you are from below:          |"
        user_city = STDIN.gets.chomp
        puts " ----------------------------------------------------"
        puts "| Please enter your motto below:                     |"
        user_motto = STDIN.gets.chomp
        @@user = User.create(name: user_name, city: user_city, age: user_age, motto: user_motto)
        puts " ----------------------------------------------------"
        puts "| Thank you for creating a user now we can have fun! |"
        self.create_favorites
    end

    def create_favorites
        puts " ----------------------------------------------------"
        puts "|        Which NFL teams are your favorites?         |"
        puts "|   Please input the team name as follows: Bengals   |"
        puts "| When done selecting your favorite teams, input: 1  |"
        puts " ----------------------------------------------------"
        user_input = STDIN.gets.chomp
        if user_input == '1'
            self.display_commands
        else
            if team = Team.find_by(name: user_input)
                FavoriteTeam.create(user_id: @@user.id, team_id: team.id)
            else
                puts "|       PLEASE FOLLOW THE DIRECTIONS PROVIDED        |"
            end
            self.create_favorites
        end
    end

    def display_commands
        puts " ----------------------------------------------------"
        puts "| Enter a number below that represents the data      |"
        puts "| you want to know. Enter the number '0' to exit.    |"
        puts "| 0. Exit                    9. Widest Fanbase Team  |"
        puts "| 1. Fans in my hood         10. Fans where visiting |"
        puts "| 2. Peeps in my hood        11. Oldest Team Fans    |"
        puts "| 3. The Bandwagon Fan       12. Youngest Team Fans  |"
        puts "| 4. Old Fart Fan            13. Worst Offense Team  |"
        puts "| 5. Most Popular Team       14. Worst Defense Team  |"
        puts "| 6. Least Liked Team        15. Best Team Mottos    |"
        puts "| 7. Biggest Baby Fan        16. Worst Team Mottos   |"
        puts "| 8. Top Scoring Team        17. Team Fan Cities     |"
        puts " ----------------------------------------------------"
        self.call_method
    end

    # calls the method that the user wants the data from and sets them back to display commands
    def call_method
        user_command = STDIN.gets.chomp
        case user_command
        when "0" 
            puts "|  Thank you for visiting FFF's! Please come again!  |"
            puts " ----------------------------------------------------"
            return
        when "1"
            @@user.fellow_fans_in_my_city
        when "2"
            @@user.print_users_in_my_city
        when "3"
            User.user_with_most_favorites
        when "4"
            User.oldest_user
        when "5" 
            Team.most_liked_team
        when "6"
            Team.least_liked_team
        when "7"
            User.youngest_user
        when "8"
            Team.puts_top_scoring
        when "9"
            Team.most_widespread_fanbase
        when "10"
            puts " Please enter the city name you want to find fans in! "
            city_name = STDIN.gets.chomp
            @@user.fans_in_visiting_city(city_name)
        when "11"
            Team.oldest_fans
        when "12"
            Team.youngest_fans
        when "13"
            Team.puts_worst_scoring
        when "14"
            Team.most_points_allowed
        when "15"
            Team.top_team_mottos
        when "16"
            Team.worst_team_mottos
        when "17"
            @@user.favorite_teams_cities
        else
            puts "|       PLEASE FOLLOW THE DIRECTIONS PROVIDED        |"
        end
        self.display_commands
    end
end