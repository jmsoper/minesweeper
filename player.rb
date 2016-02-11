class Player

  def initialize(name)
    @name = name
  end

  def request_move
    puts "Would you like to place a flag (1) or turn a tile (2)?"
    answer = gets.chomp.to_i
    puts "Please put in x,y coordinates:"
    pos = gets.chomp.split(",").map(&:to_i)
    case answer
    when 1
      then
  end



end


a = Player.new

a.request_move
