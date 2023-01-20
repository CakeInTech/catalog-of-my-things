require 'json'
require './classes/book'
require './classes/music_album'
require './classes/game'
require './classes/author'
require './classes/label'
require './classes/genre'

class App
  def initialize
    @books = []
    @labels = []

    list_of_labels_stored
    list_of_books_stored
  end

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

  def add_item_options(option)
    case option
    when '7'
      add_book
    when '8'
      add_music_album
    when '9'
      add_game
    end
  end

  def add_book
    puts 'Publisher name'
    author = gets.chomp
    puts 'What is the condition of the cover'
    cover = gets.chomp
    puts 'Date of publication (dd/mm/yyyy)'
    date = gets.chomp
    book = Book.new(author, cover, date)
    @books << book
    puts 'Add a label? Enter 1 for YES and 2 for NO'
    option = gets.chomp.to_i
    if option == 1
      puts 'Enter title of the book label'
      title = gets.chomp
      puts 'Enter color of the book label'
      color = gets.chomp
      label = Label.new(title, color)
      @labels << label
    end
    save_all_labels_and_books
  end

  def list_all_books
    if @books.empty?
      puts "\n No book is available"
    else
      @books.each do |book|
        puts "\n Publisher: #{book.publisher} | Condition: #{book.cover_state}\n"
      end
    end
  end

  def list_all_labels
    if @labels.empty?
      puts 'No labels'
    else
      @labels.each do |label|
        puts "Title: #{label.title} Coloe: #{label.color} "
      end
    end
  end

  def save_all_labels_and_books
    book_json = []
    @books.each do |book|
      book_json << { publisher: book.publisher, cover_state: book.cover_state }
    end
    books_json = JSON.generate(book_json)
    File.write('./json/books.json', books_json)
    label_json = []
    @labels.each do |label|
      label_json << { title: label.title, color: label.color }
    end
    labels_json = JSON.generate(label_json)
    File.write('./json/labels.json', labels_json)
  end

  def list_of_labels_stored
    if File.exist?('./json/labels.json') && !File.zero?('./json/labels.json')
      labelsfile = File.open('./json/labels.json')
      labeljson = labelsfile.read
      JSON.parse(labeljson).map do |label|
        labelsjson = Label.new(label['title'], label['color'])
        @labels << labelsjson
      end
      labelsfile.close
    else
      File.new('./json/labels.json', 'w')
    end
  end

  def list_of_books_stored
    if File.exist?('./json/books.json') && !File.zero?('./json/books.json')
      bookfile = File.open('./json/books.json')
      bookjson = bookfile.read
      JSON.parse(bookjson).map do |book|
        booksjson = Book.new(book['publisher'], book['cover_state'], book['publish_date'])
        @books << booksjson
      end
      bookfile.close
    else
      File.new('./json/books.json', 'w')
    end
  end

  def list_music_albums
    music_album = File.size('./json/music_album.json').zero? ? [] : JSON.parse(File.read('./json/music_album.json'))
    music_album.each do |album|
      puts "Spotify: #{album['on_spotify']}, Publish Date: #{album['publish_date']}, Genre Name: #{album['name']}"
    end
  end

  def list_all_genre
    genre = File.size('./json/genre.json').zero? ? [] : JSON.parse(File.read('./json/genre.json'))
    puts '    '
    genre.each do |genres|
      puts "Name: #{genres['name']}"
    end
    puts '    '
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
    puts 'is on_spotify(yes or no):'
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
    File.size('./json/genre.json').zero? ? [] : JSON.parse(File.read('./json/genre.json'))
  end

  def write_genres_to_file(genres)
    File.write('./json/genre.json', genres.to_json)
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
    File.size('./json/music_album.json').zero? ? [] : JSON.parse(File.read('./json/music_album.json'))
  end

  def write_music_albums_to_file(music_albums)
    File.write('./json/music_album.json', music_albums.to_json)
  end

  def add_game
    puts 'Is it multiplayer [Y/N]'
    multiplayer = gets.chomp
    puts 'publish_date (YYYY-MM-DD)'
    publish_date = gets.chomp
    puts 'Last played date (YYYY-MM-DD)'
    last_played_at = gets.chomp
    new_game = Game.new(multiplayer, last_played_at, publish_date)
    create_author(new_game)
    puts 'Game and Author were added successfully'
    store_game(new_game)
  end

  def store_game(new_game)
    obj = {
      id: new_game.id,
      multiplayer: new_game.multiplayer,
      archived: new_game.archived,
      author_name: new_game.author.first_name,
      last_played: new_game.last_played,
      publish_date: new_game.publish_date
    }

    stored_games = read_games_from_file
    stored_games << obj
    write_games_to_file(stored_games)
  end

  def read_games_from_file
    File.size('./json/game.json').zero? ? [] : JSON.parse(File.read('./json/game.json'))
  end

  def write_games_to_file(game)
    File.write('./json/game.json', game.to_json)
  end

  def create_author(item)
    puts 'Enter first name'
    first_name = gets.chomp
    puts 'Enter last name'
    last_name = gets.chomp
    new_author = Author.new(first_name, last_name)
    new_author.add_item(item)
    store_author(new_author)
  end

  def store_author(new_author)
    obj = {
      id: new_author.id,
      first_name: new_author.first_name,
      last_name: new_author.last_name
    }

    stored_authors = read_author_from_file
    stored_authors << obj
    write_author_to_file(stored_authors)
  end

  def read_author_from_file
    File.size('./json/author.json').zero? ? [] : JSON.parse(File.read('./json/author.json'))
  end

  def write_author_to_file(author)
    File.write('./json/author.json', author.to_json)
  end

  def list_all_games
    game = File.size('./json/game.json').zero? ? [] : JSON.parse(File.read('./json/game.json'))
    puts '    '
    game.each do |games|
      puts "Author_name: #{games['author_name']} last played: #{games['last_played']}"
    end
    puts '    '
  end

  def list_all_authors
    author = File.size('./json/author.json').zero? ? [] : JSON.parse(File.read('./json/author.json'))
    puts '    '
    author.each do |authors|
      puts "first_name: #{authors['first_name']} last_name: #{authors['last_name']}"
    end
    puts '    '
  end
end
