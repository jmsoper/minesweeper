require './tile'

class Board
  attr_reader :grid

  def initialize(grid_size = 9)
    @grid = Array.new(grid_size){Array.new(grid_size){Tile.new}}
    @bomb_number = grid_size
    grid_size.times{set_bombs(grid_size)}
  end

  # def [](pos)
  #   row, col = pos
  #   @grid[row][col]
  # end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def set_bombs(bomb_number)
    row = rand(bomb_number)
    col = rand(bomb_number)
    #bomb_location = [row, col]
    tile = @grid[row][col]#.is_bomb?

    unless tile.is_bomb?
      tile.set_to_bomb!
    else
      set_bombs(bomb_number)
    end
  #  p tile
  end

  def list_bombs

     p @grid.flatten.select{|b| b.is_bomb?}.length
     p @grid.flatten.select{|b| !b.is_bomb?}.length
   end

end




a = Board.new(9)
a.list_bombs
# print a.grid
