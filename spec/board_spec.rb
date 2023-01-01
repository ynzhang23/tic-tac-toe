# frozen_string_literal: true

require './lib/board'

describe Board do
  subject(:board) { described_class.new }

  describe '#update_board' do
    before do
      allow(board).to receive(:print_board)
    end

    context 'When the player chooses 3' do
      it 'Changes the hash value of position 3' do
        player_symbol = '$'
        board.update_board('3', player_symbol)
        position_three = board.board_positions['3']
        expect(position_three).to eql(player_symbol)
      end
    end
  end
end
