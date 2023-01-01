# frozen_string_literal: true

# Creates player information and determine winning condition
class Player
  attr_reader :player_name, :player_symbol, :winning_array
  attr_accessor :positions

  def initialize(player_name, player_symbol, positions)
    @player_name = player_name
    @player_symbol = player_symbol
    @positions = positions
  end

  def Player.new_player_1
    puts "Player 1's Name: "
    player_name = gets.chomp
    puts "Type your symbol: "
    player_symbol = gets.chomp
    Player.new(player_name, player_symbol, [])
  end

  def Player.new_player_2
    puts "Player 2's Name: "
    player_name = gets.chomp
    puts "Type your symbol: "
    player_symbol = gets.chomp
    Player.new(player_name, player_symbol, [])
  end

  def input_positions
    puts "Choose a position on the board (1~9): "
    position = gets.chomp
    @positions.push position
    return position
  end

  def won?
    winning_array = [
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
    winning_array.each do |connected_three|
      if @positions & connected_three == connected_three
        return true
      end
    end
    # If nothing, return false and continue the game
    return false
  end
end