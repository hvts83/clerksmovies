require 'pry'

class CliApp
    
    def run
        welcome
        user_selection = main_menu_select
        case user_selection
        when "Rent a movie"
            rent_movie
        when "New Member"
            new_member
        when "Check your Membership"
            check_your_membership
        when "Return Movie"
            return_movie
        else 
            puts "Kthxbai"
        end

    end


    def welcome
        puts "Welcome to Clerksbuster."
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

    def check_your_membership
        puts "please enter your name: "
        name = gets.chomp

        Member.all.select(:name, :id, :active).each do |members|
            active = members.active == true ? "Active" : "Inactive"
            if name.downcase == members.name.downcase
                puts "\n Name: #{members.name} \n ID: #{members.id} \n Your membership is #{active}."
            end
        end
    end

    def search_by_title
        prompt = TTY::Prompt.new
        prompt.ask("Search movie by title: ", required: true)
        

        # give error message "We dont have that movie would you like to choose another title or return
        # to the main menu"
        # select movie
        # move to checkout

    end

    
    def new_member # Felix
        prompt = TTY::Prompt.new
        # prompt.ask("Please enter your information below", required: true)
        puts "Please enter name: " 
        name = gets.chomp
        puts "Please enter age: "
        age = gets.chomp
        # binding.pry
        newmember = Member.create(name: name, age: age, active: true)
        newmember.save
        puts "Welcome to clerksbuster, snootchy bootchies"
    end
    
    def view_all_movies
        # prompt = TTY::Prompt.new
        puts "ClerksBuster has all these amazing movies"
        puts "========================================="
        print_movies_list
        # grab all movies
        # alphabetical sort
        # list to prompt/screen
        # tty prompt to choose movie
        # send to checkout after choosing movie
        
    end
    
    def print_movies_list
        # SG = User can change selection
        #   if no quantity dont show movie
        choices = Array.new
        prompt = TTY::Prompt.new
        movie_hash = {} # Hash.new
        
        check_this = Movie.select(:id, :name, :year, :copies).each do |movie_obj|
            choices << "Name: #{movie_obj.name}. Year: #{movie_obj.year}. Copies: #{movie_obj.copies}"
            movie_hash["Name: #{movie_obj.name}. Year: #{movie_obj.year}. Copies: #{movie_obj.copies}"] = movie_obj
        end
        movie_selection = prompt.select("Select option?", choices.sort)
        checkout(movie_hash[movie_selection])
    end
    
    
    def checkout(movie)
        # checkout prompt
        # display chosen movie
        # prompt for member id
        # confirm
        # create rental instance with member and movie with id's and time stamp
        # decrement quantity
        # due date + 3 days
        # "Thank you for renting #{movie} your movie will be due at #{date}."
        
        # prompt = TTY::Prompt.new
        puts "Thank you for your selection please enter your member credentials: "
        name = gets.chomp
        member = Member.select(:id, :name).select do |members|
            # binding.pry
            members.name.downcase == name.downcase
            #     puts "success"
            # else
            #     puts "Would you like to become a member? otherwise youll have to watch the last jedi on repeat"
            # end
        end
        attributes = {
            member_id: member[0].id, 
            movie_id: movie.id, 
            rental_date: DateTime.now.to_date, 
            due_date: DateTime.now.to_date + 3,
            movie_returned: false
        }
        # binding.pry
        new_rental = Rental.new(attributes)
        new_rental.save
        d = attributes[:due_date]
        puts "Thank you for renting #{movie.name} your movie will be due at #{d}."

    end
    
    def exit(rental=nil)
        if movie==nil
            puts "Thanks for visiting Clerksbuster"
        else
            puts "Thanks for renting at Clerksbuster!  Please enjoy #{rental.movie.name}!  Your movie is due #{movie.rental} Be kind, rewind!"
        end
    end
    
end  # end of CliApp