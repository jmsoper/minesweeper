class Player

  def initialize(name)
    @name = name
  end

  def request_move
    puts "Type 'flag' to set flag"
    puts "or 'tile' to reveal a tile."
    answer = gets.chomp
    puts "Please input row, column:"
    pos = gets.chomp.split(",").map{|n| n.to_i - 1}
    [answer, pos]
  end
end
