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
            search_by_title
        else
            view_all_movies
        end
        # binding.pry   
    end

    def search_by_title
        prompt = TTY::Prompt.new
        prompt.ask("Search movie by title: ", required: true)

        # give error message "We dont have that movie would you like to choose another title or return
        # to the main menu"
        # select movie
        # move to checkout

    end

    def view_all_movies
        # prompt = TTY::Prompt.new
        puts "ClerksBuster has all these amazing movies"
        puts "========================================="

        # grab all movies
        # alphabetical sort
        # list to prompt/screen
        # tty prompt to choose movie
        # send to checkout after choosing movie

    end

    def checkout(movie, member)
        # checkout prompt
        # display chosen movie
        # prompt for member id
        # confirm
        # create rental instance with member and movie with id's and time stamp
        # decrement quantity
        # due date + 3 days
        # "Thank you for renting #{movie} your movie will be due at #{date}."
        # thank you, exit


    end

end  # end of CliApp