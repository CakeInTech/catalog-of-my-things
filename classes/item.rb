require 'date'

class Item
  attr_accessor :publish_date
  attr_reader :id, :genre, :archived, :author, :label

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = true
  end

  def can_be_archived?
    published_year = Date.strptime(@published_date, '%d-%m-%Y').strftime('%Y')
    Time.now.year - published_year.to_i > 10
  end

  def add_author(author)
    author.extra_option << self unless author.items.include? self
    @author = author
  end
end
