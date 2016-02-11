class Board
  attr_reader :grid

  def initialize(grid_size = 9)
    @grid = Array.new(grid_size){Array.new(grid_size, Tile.new(:empty))}
    @bomb_number = grid_size
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def set_bombs(bomb_number)
    row = rand(bomb_number)
    col = rand(bomb_number)
    unless @grid[row, col].value == :bomb
      @grid[row, col].value(:bomb)
    else
      set_bombs(1)
    end
  end

end
