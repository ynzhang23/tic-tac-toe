# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

# Ask for player info
player_one = Player.new_player_1
player_two = Player.new_player_2

# Print out board
board = Board.new
board.print_board

input_position = ''

# Repeat for 4 rounds
4.times do
  # player_one's choice
  # Until chosen position is a number (it will be a string if it has already been occupied), ask again
  input_position = player_one.input_positions until board.board_positions[input_position].is_a? Numeric
  # Replace value with player symbol
  board.update_board(input_position, player_one.player_symbol)
  input_position = ''
  # Check for win
  if player_one.won?
    puts "Winner is #{player_one.player_name}!!!"
    exit
  end

  # player_two's choice
  # Until chosen position is a number (it will be a string if it has already been occupied), ask again
  input_position = player_two.input_positions until board.board_positions[input_position].is_a? Numeric
  # Replace value with player symbol
  board.update_board(input_position, player_two.player_symbol) 
  input_position = ''

  # Check for win
  if player_two.won?
    puts "Winner is #{player_two.player_name}!!!"
    exit
  end
end

# Last Turn
# player_one's choice
# Until chosen position is a number (it will be a string if it has already been occupied), ask again
input_position = player_one.input_positions until board.board_positions[input_position].is_a? Numeric

# Replace value with player symbol
board.update_board(input_position, player_one.player_symbol)
puts "It's a draw!"
exit
