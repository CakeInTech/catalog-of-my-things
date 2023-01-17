require_relative './app'

class Main 
    def start 
        new_app = App.new
        loop do 
            select_option
            option = gets.chomp.to_i
            break if option == 10

            new_app.select_option(option)
            new_app.extra_option(option) if option.between?(7, 9) 
        end 
    end
    
    def select_option
        puts 'Welcome to the catalog app'
        puts 'Please choose an option by entering a number:'
        puts '1  - List all books'
        puts '2  - List all music albums'
        puts '3  - List all games'
        puts '4  - List all genres'
        puts '5  - List all labels'
        puts '6  - List all authors'
        puts '7  - Add a book'
        puts '8  - Add a music album'
        puts '9  - Add a game'
        puts '10 - exit'
    end
end

def main 
    Main.new.start
end

main