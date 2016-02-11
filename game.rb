require './tile'
require './board'
require './player'


class Game

  def initialize(name)
    @player = Player.new(name)
    @board = Board.new
    @over = false

  end

  def play_turn
    @board.render
    answer, pos = @player.request_move
    if answer == "flag"
      @board[pos].set_flag
    elsif answer == "tile"
      check_for_bomb(pos)
      @board[pos].reveal_tile
    end
      @board.render
  end

  def check_for_bomb(pos)
    if @board[pos].is_bomb?
      puts "<<KABOOM>>"
      game_over
    end
  end

  def play
    until @over
      play_turn
    end
  end

  def game_over
    @over = true
  end

end

a = Game.new("Julia+Yossi")
a.play
