class Board

  def initialize(grid_size = 9)
    @grid = Array.new(grid_size){Array.new(grid_size, Tile.new(:empty))}
    @grid_size = grid_size *
  end


  def set_bombs


  end    

end
