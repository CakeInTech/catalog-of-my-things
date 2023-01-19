require_relative './item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played

  attr_reader :games_collection, :type

  def initialize(multiplayer, last_played, publish_date)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played = last_played
    @games_collection = []
    @type = 'Game'
  end

  def can_be_archived?
    item_age = Time.now.year - @publish_date.year
    since_played = Time.now.year - @last_played.year
    return true if item_age > 10 && since_played > 2

    false
  end
end
