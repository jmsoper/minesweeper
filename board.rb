require './tile'

class Board
  attr_reader :grid

  def initialize(grid_size = 9)
    @bomb_locations = Array.new
    @grid = Array.new(grid_size){Array.new(grid_size){Tile.new}}
    @bomb_number = grid_size
    @row_length = grid_size - 1
    grid_size.times{set_bombs(grid_size)}
    render

  end

  def render
    puts "   1  2  3  4  5  6  7  8  9 "
    @grid.each_with_index do |row, row_index|
      row.each_with_index do |tile, index|
        print "#{row_index + 1} " if index == 0
        tile.show
          puts if index == @row_length
      end
    end
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
