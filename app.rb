require './classes/book'
require './classes/music_a'
require './classes/game'
require './classes/author'
require './classes/label'
require './classes/genre'

class App
  def process_options(option)
    case option 
    when 1..3
      list_items(option)
    when 4..5
      list_genres_or_labels
    when 6 
      list_authors
    when 7..9 
      add_item(option)
    else 
      puts "Invalid option. Please choose a valid option."
    end
  end

  def list_items(option)
    case option 
    when 1 
      list_books 
    when 2 
      list_music_albums
    when 3 
      list_games
    end
  end

  def list_genres_or_labels(option)
    case option
    when 4
      list_genres
    when 5
      list_lables
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

# Metrics/CyclomaticComplexity: Cyclomatic complexity for process_options is too high. [10/7]
#   def process_options(option) ...
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^