require 'rspec'
require_relative '../classes/music_album'

describe MusicAlbum do
  let(:publish_date) { Time.now }
  let(:album) { MusicAlbum.new(true, publish_date) }

  describe '#initialize' do
    it 'sets the on_spotify and publish date attributes' do
      expect(album.on_spotify).to eq(true)
      expect(album.publish_date).to eq(publish_date)
    end
  end
end
