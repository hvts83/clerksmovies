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

        choices = ["Rent a movie", "New Member", "Check your Membership", "Return Movie","Exit"]
        prompt.select("Select option?", choices)
    end

    def rent_movie
        prompt = TTY::Prompt.new
        choices = ["Search by Titles", "View all Movies"]
        # prompt.select("Select option?", choices)

        movie_selection = prompt.select("Select option?", choices)
        case movie_selection
        when "Search by Titles"
            search_movies
        else
            view_all_movies
        end
        # binding.pry   
    end

    def search_movies
        prompt = TTY::Prompt.new
        prompt.ask("Search movie by title:", required: true)
    end

    def view_all_movies
        prompt = TTY::Prompt.new
        puts "ClerksBuster has all these amazing movies"
        puts "========================================="
    end

end  # end of CliApp