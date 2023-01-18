require_relative '../label'
require_relative '../book'

describe 'Testing of label' do
  it 'Testing of method' do
    spec_title = 'science'
    spec_color = 'cyan'

    label = Label.new(spec_title, spec_color)

    expect(label.title).to eq(spec_title)
    expect(label.color).to eq(spec_color)
  end

  it 'Testing of add_item method' do
    spec_publisher = 'Dhanpat Rai'
    spec_publish_date = '17/10/2012'
    spec_cover_state = 'Good'

    book = Book.new(spec_publisher, spec_cover_state, spec_publish_date)

    spec_title = 'science'
    spec_color = 'cyan'

    label = Label.new(spec_title, spec_color)
    label.add_item(book)

    expect(label.items[0].publisher).to eq(spec_publisher)
    expect(label.items[0].publish_date).to eq(spec_publish_date)
    expect(label.items[0].cover_state).to eq(spec_cover_state)
  end
end