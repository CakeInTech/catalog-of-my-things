require './classes/game'

describe Game do
  before :each do
    @game = Game.new('YES', '2001-09-11', '1997-02-06')
  end
  it 'returns the correct last played date' do
    expect(@game.last_played).to eq '2001-09-11'
  end
  it 'returns the correct multiplayer status' do
    expect(@game.multiplayer).to eq 'YES'
  end
  it 'returns the correct publish date' do
    expect(@game.publish_date).to eq '1997-02-06'
  end
end
