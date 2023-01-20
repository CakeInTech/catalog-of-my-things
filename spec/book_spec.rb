require_relative '../classes/book'
require_relative '../classes/label'

describe 'Testing book' do
  it 'Testing methods' do
    publisher = 'John Bush'
    publish_date = '29/01/2001'
    cover_state = 'Good'

    book = Book.new(publisher, cover_state, publish_date)

    expect(book.publisher).to eq(publisher)
    expect(book.cover_state).to eq(cover_state)
    expect(book.publish_date).to eq(publish_date)
    expect(book.archived).to eq(false)
  end

  it 'Testing the add_label method' do
    publisher = 'John Bush'
    publish_date = '29/01/2001'
    cover_state = 'Good'
    book = Book.new(publisher, cover_state, publish_date)

    title = 'title'
    color = 'red'
    label = Label.new(title, color)
    book.add_label(label)

    expect(book.label).to eq(label)
  end
end
