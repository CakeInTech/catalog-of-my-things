require_relative 'item'
class Book < Item
  attr_accessor :publisher, :cover_state, :publish_date

  alias can_be can_be_archived?

  def initialize(publisher, cover_state, publish_date, id = Random.rand(1..100))
    super(publish_date, id)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    @cover_state == 'bad' || can_be
  end
end
