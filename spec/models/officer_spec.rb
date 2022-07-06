require 'rails_helper'

RSpec.describe Officer, type: :model do
  it {should have_many :arrests}

  describe 'instance methods' do
    describe '#average_song_length' do
      before :each do
        @prince = Officer.create!(name: 'Prince')
        @purple = @prince.songs.create!(title: 'Purple Rain', length: 835, play_count: 8934)
        @beret = @prince.songs.create!(title: 'Raspberry Beret', length: 934, play_count: 930)
        @other_song = @prince.songs.create!(title: 'Other Song', length: 921, play_count: 630)
      end
        it 'returns the average song length' do
          expect(@prince.average_song_length.round(2)).to eql(0.89667e3)
        end
    end
  end

end