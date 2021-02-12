require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require './lib/game'
require './lib/timer'
require './lib/turn'

# turn = Turn.new #(board)
# timer = Timer.new #(board)


secret_code = []
colors = ['y', 'r', 'g', 'b']
4.times do
  secret_code << colors.sample
end

game = Game.new(secret_code)
game.start_game
