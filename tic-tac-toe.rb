require "pry-byebug"

# Class: players
class Player
  attr_reader :name, :symbol, :positions
  
  def initialize(name, symbol, positions)
    @name = name
    @symbol = symbol
    @positions = positions
  end

  def Player.new_player_1()
    puts "Player 1's Name: "
    name = gets.chomp
    puts "Choose your symbol: "
    symbol = gets.chomp
    Player.new(name, symbol, [])
  end

  def Player.new_player_2()
    puts "Player 2's Name: "
    name = gets.chomp
    puts "Choose your symbol: "
    symbol = gets.chomp
    Player.new(name, symbol, [])
  end
end

# Class: board
class Board
  attr_reader :board_positions

  def initialize()
    @board_positions = {
      r1_c1: "1",
      r1_c2: "2",
      r1_c3: "3",
      r2_c1: "4",
      r2_c2: "5",
      r2_c3: "6",
      r3_c1: "7",
      r3_c2: "8",
      r3_c3: "9",
    }
  end

  def print_board()
    puts " #{@board_positions[:r1_c1]} | #{@board_positions[:r1_c2]} | #{@board_positions[:r1_c3]} "
    puts "-----------"
    puts " #{@board_positions[:r2_c1]} | #{@board_positions[:r2_c2]} | #{@board_positions[:r2_c3]} "
    puts "-----------"
    puts " #{@board_positions[:r3_c1]} | #{@board_positions[:r3_c2]} | #{@board_positions[:r3_c3]} "
  end
end

# Ask for player info
player_1 = Player.new_player_1
player_2 = Player.new_player_2

# Print out board
board = Board.new
board.print_board

# Ask for player_1's position
  # if chosen position already occupied, ask again
  # replace value with player symbol
# ask for player_2's position
  # if chosen position already occupied, ask again
  # replace value with player symbol