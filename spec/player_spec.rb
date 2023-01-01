# frozen_string_literal: true

require './lib/player'

describe Player do
  subject(:james) { Player.new('james', '*', []) }

  describe '#input_positions' do
    before do
      allow(james).to receive(:gets).and_return('9')
    end

    context 'When the input position is 9' do
      it 'Updates the player position array' do
        positions = james.positions
        james.input_positions
        expect(positions[-1]).to eql('9')
      end
    end
  end

  describe '#won?' do
    context 'When james does not have three positions lined up' do
      it 'Returns false for incomplete winning conditions' do
        james.positions = %w[1 2 4]
        result = james.won?
        expect(result).to eql(false)
      end
    end

    context 'When james has three positions lined up ' do
      it 'Returns true for complete winning conditions' do
        james.positions = %w[1 2 3 4]
        result = james.won?
        expect(result).to eql(true)
      end
    end
  end
end
