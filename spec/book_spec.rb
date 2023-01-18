require_relative '../book'
require_relative '../label'

describe 'Testing of book' do
  it 'Testing of method' do
    spec_publisher = 'Dhanpat Rai'
    spec_publish_date = '17/10/2012'
    spec_cover_state = 'Good'

    book = Book.new(spec_publisher, spec_cover_state, spec_publish_date)

    expect(book.publisher).to eq(spec_publisher)
    expect(book.cover_state).to eq(spec_cover_state)
    expect(book.publish_date).to eq(spec_publish_date)
    expect(book.archived).to eq(false)
  end

  it 'Testing of class methods' do
    spec_publisher = 'Dhanpat Rai'
    old_date = '17/10/2012'
    new_date = '17/10/2021'
    good_cover = 'good'
    bad_cover = 'bad'

    book_spec1 = Book.new(spec_publisher, good_cover, old_date)
    book_spec2 = Book.new(spec_publisher, good_cover, new_date)
    book_spec3 = Book.new(spec_publisher, bad_cover, old_date)
    book_spec4 = Book.new(spec_publisher, bad_cover, new_date)

    expect(book_spec1.can_be_archived?).to eq(false)
    expect(book_spec2.can_be_archived?).to eq(false)
    expect(book_spec3.can_be_archived?).to eq(true)
    expect(book_spec4.can_be_archived?).to eq(true)
  end

  it 'Testing of the add_label method' do
    spec_publisher = 'Dhanpat Rai'
    spec_publish_date = '17/10/2012'
    spec_cover_state = 'Good'
    book = Book.new(spec_publisher, spec_cover_state, spec_publish_date)

    spec_title = 'title'
    spec_color = 'red'
    label = Label.new(spec_title, spec_color)
    book.add_label(label)

    expect(book.label).to eq(label)
  end
end