class Cell
  attr_reader :x, :y, :state
  attr_accessor :new_state

  def initialize(x, y, state)
    @x, @y, @state = x, y, state
  end

  def live
    @state = new_state
  end
end

class Universe
  def initialize(w, h)
    @width = w
    @heigth = h
  end

  def cells
    arr = []
    @width.times.each do |w|
      @heigth.times.each do |h|
        arr << Cell.new(h, w, rand(2))
      end
    end
    arr
  end
end

