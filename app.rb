require 'json'
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

  def add_genre(item)
    puts 'Add Name'
    name = gets.chomp
    genre = Genre.new(name)
    genre.add_item(item)
    puts '     '
    puts 'Genre created successfully'
    store_genre(genre)
  end

  def add_music_album
    puts 'Add spotify(yes or no):'
    on_spotify = gets.chomp
    puts 'Add publish date (YYYY-MM-DD):'
    publish_date = gets.chomp
    begin
      Date.parse(publish_date)
    rescue StandardError
      puts 'Invalid date format. Please use YYYY-MM-DD.'
      return
    end
    music_album = MusicAlbum.new(on_spotify, publish_date)
    add_genre(music_album)
    puts 'Music Album created successfully'
    puts '       '
    store_music_album(music_album)
  end

  def store_genre(genre)
    obj = {
      id: genre.id,
      name: genre.name
    }

    stored_genres = read_genres_from_file
    stored_genres << obj
    write_genres_to_file(stored_genres)
  end

  def read_genres_from_file
    File.size('./classes/genre.json').zero? ? [] : JSON.parse(File.read('./classes/genre.json'))
  end

  def write_genres_to_file(genres)
    File.write('./classes/genre.json', genres.to_json)
  end

  def store_music_album(music_album)
    obj = {
      id: music_album.id,
      on_spotify: music_album.on_spotify,
      publish_date: music_album.publish_date,
      name: music_album.genre.name
    }

    stored_music_albums = read_music_albums_from_file
    stored_music_albums << obj
    write_music_albums_to_file(stored_music_albums)
  end

  def read_music_albums_from_file
    File.size('./classes/music_album.json').zero? ? [] : JSON.parse(File.read('./classes/music_album.json'))
  end

  def write_music_albums_to_file(music_albums)
    File.write('./classes/music_album.json', music_albums.to_json)
  end
end
