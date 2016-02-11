class Tile

  def initialize()
    @bomb = false
  end

  def set_to_bomb!
    @bomb = true
  end

  def is_bomb?
    @bomb
  end


end
