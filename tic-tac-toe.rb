require "pry-byebug"
# Class: board
class Board
  attr_accessor :board_positions

  def initialize()
    @board_positions = {
      "1" => "*",
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

  def update_board(chosen_position, player_symbol)
    @board_positions[chosen_position] = player_symbol
    print_board
  end
end

# Class: players
class Player
  attr_reader :player_name, :player_symbol, :positions
  
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
end

# Ask for player info
player_1 = Player.new_player_1
player_2 = Player.new_player_2

# Print out board
board = Board.new
board.print_board

# Ask for player_1's choice
input_position = ''

# until chosen position is a number (it will be a string if it has already been occupied), ask again
until board.board_positions[input_position].is_a? Numeric
  input_position = player_1.input_positions
end

# replace value with player symbol
board.update_board(chosen_position, player_1.player_symbol)
input_position = ''

# ask for player_2's position

# until chosen position is a number (it will be a string if it has already been occupied), ask again
until board.board_positions[chosen_position].is_a? Numeric
  chosen_position = player_2.input_positions
end

# replace value with player symbol
board.update_board(chosen_position, player_2.player_symbol) 