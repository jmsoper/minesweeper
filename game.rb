require './tile'
require './board'
require './player'


class Game

  def initialize(name)
    @player = Player.new(name)
    @board = Board.new
  end

  def play_turn
    @player.request_move
  end

  def play
    until over?
      play_turn
    end
  end

  def over?
    hit bomb
    or
    won 
  end



end
