require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    @turn = Turn.new   #(player1=nil, player2=nil)
    @game.get_guess #Keep this or not?
  end

  def
