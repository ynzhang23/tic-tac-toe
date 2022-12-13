require "pry-byebug"

# initialize players
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
player_1 = Player.new_player_1
player_2 = Player.new_player_2

# initialize board


# print out board
# ask for player_1's position
  # if chosen position already occupied, ask again
  # replace value with player symbol
# ask for player_2's position
  # if chosen position already occupied, ask again
  # replace value with player symbol