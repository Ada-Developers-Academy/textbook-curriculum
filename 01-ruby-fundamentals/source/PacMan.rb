
class PacMan

  attr_accessor :x, :y, :direction


  def initialize(xval, yval, dir)
    @x = xval
    @y = yval
    @direction = dir
  end

  def x
    return @x
  end

end

def x= (val)
  @x = val
end


player1 = PacMan.new(3, 4, :up)
player2 = PacMan.new(10, 15, :down)


puts player1.to_s + player2.to_s
