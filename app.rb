require './classes/book'
require './classes/music_album'
require './classes/game'
require './classes/author'
require './classes/label'
require './classes/genre'

class App
  def select_option(option)
    case option
    when '1'
      list_all_books
    when '2'
      list_music_albums
    when '3'
      list_all_games
    when '4'
      list_all_genre
    when '5'
      list_all_labels
    when '6'
      list_all_authors
    end
  end

  def add_item(option)
    case option
    when 7
      add_book
    when 8
      add_music_album
    when 9
      add_game
    end
  end

  def list_music_albums
    if @music_albums.empty?
      puts 'No music albums have been added yet.'
    else
      puts 'List of music albums:'
      @music_albums.each { |album| puts "#{album.name} by #{album.artist}" }
    end
  end

  def list_genres
    if @genres.empty?
      puts 'No genres have been added yet.'
    else
      puts 'List of genres:'
      @genres.each { |genre| puts genre }
    end
  end
end



def add_music_album 
  puts 'Add spotify(yes or no):'
  on_spotify = gets.chomp
  puts 'Add publish date (YYYY-MM-DD):'
  publish_date = gets.chomp
  begin
    Date.parse(publish_date)
  rescue 
    puts 'Invalid date format. Please use YYYY-MM-DD.'
    return  
  end
end

# Metrics/CyclomaticComplexity: Cyclomatic complexity for process_options is too high. [10/7]
#   def process_options(option) ...
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^
