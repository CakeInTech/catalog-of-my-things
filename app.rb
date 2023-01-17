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
end
