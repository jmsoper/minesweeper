class Tile
  attr_accessor :bombs_near_by

  def initialize
    @bomb = false
    @bombs_near_by = 0
    @showing = false
  end

  def set_to_bomb!
    @bomb = true
  end

  def is_bomb?
    @bomb
  end

  def show
    if @showing
      if @bomb
        print " B "
      else
        print " _ "
      end
    else
      print " ? "
   end
 end










end
