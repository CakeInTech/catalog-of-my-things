require 'date'

class Item
  attr_accessor :publish_date, :archived
  attr_reader :id, :genre, :author, :label

  def initialize(publish_date, id = Random.rand(1...999_999))
    @id = id
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    published_year = Date.strptime(@published_date, '%d-%m-%Y').strftime('%Y')
    Time.now.year - published_year.to_i > 10
  end

  def add_author(author)
    author.extra_option << self unless author.items.include? self
    @author = author
  end

  def add_genre(genre)
    genre.add_item << self unless genre.items.include? self
    @genre = Genre
  end

  def add_label(label)
    @label = label
    label.add_item(label)
  end
end
