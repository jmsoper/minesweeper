require './tile'

class Board
  attr_reader :grid

  def initialize(grid_size = 9)
    @bomb_locations = Array.new
    @grid = Array.new(grid_size){Array.new(grid_size){Tile.new}}
    @bomb_number = grid_size
    @row_length = grid_size - 1
    grid_size.times{set_bombs(grid_size)}
    set_bomb_proximity
  end

  def render
    puts "    1  2  3  4  5  6  7  8  9 "
    puts "   --------------------------"
    @grid.each_with_index do |row, row_index|
      row.each_with_index do |tile, index|
        print "#{row_index + 1} |" if index == 0
        tile.show
          puts if index == @row_length
      end
    end
  end

  def set_bomb_proximity
    @bomb_locations.each do |pos|
      set_tile_values(pos)
    end
  end

  def get_neighbors(pos)
    row, col = pos
    up = col + 1
    down = col - 1
    left = row - 1
    right = row + 1
    neighbors = []
    neighbors << upper_left = [left, up]
    neighbors << top_center = [row, up]
    neighbors << top_right = [right, up]
    neighbors << left_of = [left, col]
    neighbors << right_of = [right, col]
    neighbors << bottom_left = [left, down]
    neighbors << bottom_center = [row, down]
    neighbors << bottom_right = [right, down]
    neighbors
  end

  def set_tile_values(bomb_position)
    neighbors = get_neighbors(bomb_position)
    neighbors.each do |neighbor|
      row, col = neighbor
      if row.between?(0, @row_length) && col.between?(0, @row_length)
        tile = self[neighbor]
        unless tile.is_bomb?
          tile.bombs_near_by += 1
        end
      end
    end
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
    tile = @grid[row][col]
    unless tile.is_bomb?
      tile.set_to_bomb!
      @bomb_locations << [row, col]
    else
      set_bombs(bomb_number)
    end

  end

  def list_bombs
    p @grid.flatten.select{|b| b.is_bomb?}.length
    p @grid.flatten.select{|b| !b.is_bomb?}.length
  end

end




a = Board.new(9)
