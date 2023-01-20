require './classes/author'

describe Author do
  author = Author.new('Michael', 'Scoffield')
  it 'returns correct author first name' do
    expect(author.first_name).to eq 'Michael'
  end
  it 'returns correct author last name' do
    expect(author.last_name).to eq 'Scoffield'
  end
end
