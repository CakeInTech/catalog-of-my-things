require 'rspec'
require_relative '../classes/genre'

describe Genre do
  let(:name) { ' Cake ' }
  let(:genre_name) { ' Cake ' }
  let(:genre) { Genre.new(name, genre_name) }
  let(:item) { double('item') }

  describe '#initialize' do
    it 'sets the name and genre_name attributes' do
      expect(genre.name).to eq(genre_name)
    end

    it 'sets the id to a random number between 1 and 1000' do
      expect(genre.id).to be_between(1, 1000)
    end
  end

  describe '#add_item' do
    before do
      allow(item).to receive(:add_genre)
    end

    it 'adds the item to the items array' do
      genre.add_item(item)
      expect(genre.items).to include(item)
    end

    it 'calls add_genre on the item' do
      expect(item).to receive(:add_genre).with(genre)
      genre.add_item(item)
    end
  end
end
