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
end

def main 
    Main.new.start
end

main