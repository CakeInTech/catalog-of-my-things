require_relative '../music_album'
require_relative '../genre'

describe 'Testing Album' do
  it 'Testing add genre' do
    name = 'rap'
    genre = Genre.new(name)

    expect(genre.name).to eq(name)
  end
end