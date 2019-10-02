class CliApp
    
    def run
        welcome
        user_selection = main_menu_select
        case user_selection
        when "Rent a movie"
            rent_movie
        else 
            puts "Not a valid option."
        end

    end

    def welcome
        puts "Welcome to Clerkbuster."
    end

    def main_menu_select
        prompt = TTY::Prompt.new

        choices = ["Rent a movie", "A", "B"]
        prompt.select("Select option?", choices)
    end

end  # end of CliApp