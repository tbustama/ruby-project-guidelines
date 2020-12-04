class Menu
    # starts the menu, this will be the first/only thing 
    # that needs to be called on the instance    
    @@user = nil
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
        @@user = User.new(name: user_name, city: user_city, age: user_age, motto: user_motto)
        puts " ----------------------------------------------------"
        puts "| Thank you for creating a user now we can have fun! |"
        self.display_commands
    end

    def display_commands
        puts " ----------------------------------------------------"
        puts "| Enter a number below that represents the data      |"
        puts "| you want to know. Enter the number '0' to exit.    |"
        puts "| 0. Exit                    5. Most Popular Team    |"
        puts "| 1. Fans in my hood         6. Least Liked Team     |"
        puts "| 2. Peeps in my hood        7. Biggest Baby Fan     |"
        puts "| 3. Old Fart Fan            8. Biggest Scoring Team |"
        puts "| 4. The bandwagon Fan       9. Widest Fanbase Team  |"
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
            @@user.users_in_my_city
        when "3"
            Team.oldest_fans
        when "4"
            User.oldest_user
        when "5" 
            Team.most_liked_team
        when "6"
            Team.least_liked_team
        when "7"
            User.youngest_user
        when "8"
            Team.top_scoring_team
        when "9"
            Team.most_widespread_fanbase
        else
            puts "|       PLEASE FOLLOW THE DIRECTIONS PROVIDED        |"
            self.display_commands
        end
        self.display_commands
    end
end