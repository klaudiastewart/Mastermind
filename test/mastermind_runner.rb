require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require './lib/game'
require './lib/timer'
require './lib/turn'

game = Game.new   #(player1=nil, player2=nil)
game.start
