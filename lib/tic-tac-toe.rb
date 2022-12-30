require "pry-byebug"
# Class: board
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

# Class: players
class Player
  attr_reader :player_name, :player_symbol, :positions, :winning_array
  
  def initialize(player_name, player_symbol, positions)
    @player_name = player_name
    @player_symbol = player_symbol
    @positions = positions
  end

  def Player.new_player_1()
    puts "Player 1's Name: "
    player_name = gets.chomp
    puts "Type your symbol: "
    player_symbol = gets.chomp
    Player.new(player_name, player_symbol, [])
  end

  def Player.new_player_2()
    puts "Player 2's Name: "
    player_name = gets.chomp
    puts "Type your symbol: "
    player_symbol = gets.chomp
    Player.new(player_name, player_symbol, [])
  end

  def input_positions ()
    puts "Choose a position on the board (1~9): "
    position = gets.chomp
    @positions.push position
    return position
  end

  def won?()
    @winning_array = [
      ["1", "2", "3"],
      ["4", "5", "6"],
      ["7", "8", "9"],
      ["1", "4", "7"],
      ["2", "5", "8"],
      ["3", "6", "9"],
      ["1", "5", "9"],
      ["3", "5", "7"]
    ]
    # Check if the player positions are part of the winning combinations
    @winning_array.each do |connected_three|
      if @positions & connected_three == connected_three
        return true
      end
    end
    # If nothing, return false and continue the game
    return false
  end
end

# Ask for player info
player_1 = Player.new_player_1
player_2 = Player.new_player_2

# Print out board
board = Board.new
board.print_board

input_position = ''

# Repeat for 4 rounds
4.times do 
  # Player_1's choice
  # Until chosen position is a number (it will be a string if it has already been occupied), ask again
  until board.board_positions[input_position].is_a? Numeric
    input_position = player_1.input_positions
  end
  # Replace value with player symbol
  board.update_board(input_position, player_1.player_symbol)
  input_position = ''
  # Check for win
  if player_1.won?
    puts "Winner is #{player_1.player_name}!!!"
    exit
  end

  # Player_2's choice
  # Until chosen position is a number (it will be a string if it has already been occupied), ask again
  until board.board_positions[input_position].is_a? Numeric
    input_position = player_2.input_positions
  end
  # Replace value with player symbol
  board.update_board(input_position, player_2.player_symbol) 
  input_position = ''

  # Check for win
  if player_2.won?
    puts "Winner is #{player_2.player_name}!!!"
    exit
  end
end

# Last Turn
# Player_1's choice
# Until chosen position is a number (it will be a string if it has already been occupied), ask again
until board.board_positions[input_position].is_a? Numeric
  input_position = player_1.input_positions
end
# Replace value with player symbol
board.update_board(input_position, player_1.player_symbol)
puts "It's a draw!"
exit