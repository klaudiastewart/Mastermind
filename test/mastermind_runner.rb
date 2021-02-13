require 'minitest/autorun'
require 'minitest/pride'
require './lib/code'
require './lib/game'
require './lib/timer'
require './lib/turn'

# turn = Turn.new #(board)
# timer = Timer.new #(board)

secret_code = Code.new(4, "Red", "Blue", "Green", "Yellow")

game = Game.new(secret_code)
game.start_game
