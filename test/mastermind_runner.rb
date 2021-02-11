require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require './lib/game'
require './lib/timer'
require './lib/turn'

# game = Game.new   #(player1=nil, player2=nil)
turn = Turn.new #(board)
timer = Timer.new #(board)

game = Game.new(turn)
game.start
