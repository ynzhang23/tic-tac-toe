# frozen_string_literal: true

# Creates board positions and update board status
class Board
  attr_accessor :board_positions

  def initialize()
    @board_positions = {
      "1" => 1,
      "2" => 2,
      "3" => 3,
      "4" => 4,
      "5" => 5,
      "6" => 6,
      "7" => 7,
      "8" => 8,
      "9" => 9,
    }
  end

  def print_board()
    puts " #{@board_positions["1"]} | #{@board_positions["2"]} | #{@board_positions["3"]} "
    puts "-----------"
    puts " #{@board_positions["4"]} | #{@board_positions["5"]} | #{@board_positions["6"]} "
    puts "-----------"
    puts " #{@board_positions["7"]} | #{@board_positions["8"]} | #{@board_positions["9"]} "
  end

  def update_board(input_position, player_symbol)
    @board_positions[input_position] = player_symbol
    print_board
  end
end
