class Tile
  attr_accessor :bombs_near_by

  def initialize
    @bomb = false
    @bombs_near_by = 0
    @showing = false
    @flagged = false
  end

  def set_flag
    @flagged = true
  end

  def is_flagged?
    @flagged
  end

  def set_to_bomb!
    @bomb = true
  end

  def is_bomb?
    @bomb
  end

  def show
    if @showing
      if @flagged
        print " |>"
      elsif @bomb
        print " B "
      elsif @bombs_near_by == 0
        print " * "
      else
        print " #{@bombs_near_by} "
      end
    else
      print " ? "
   end
 end










end
