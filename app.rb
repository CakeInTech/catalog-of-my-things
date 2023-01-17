require './book'
require './music_album'
require './game'
require './author'
require './label'
require './genre'

class App 
    def initialize 
        @books = []
        @music_album = []
        @games = []
        @genres = []
        @labels = []
        @authors = []
    end

    def process_option(option)
        case option
        when 1
          list_books
        when 2
          list_music_albums
        when 3
          list_games
        when 4
          list_genres
        when 5
          list_labels
        when 6
          list_authors
        when 7
          add_book
        when 8
          add_music_album
        when 9
          add_game
        else
          puts "Invalid option. Please choose a valid option."
        end
    end
end
