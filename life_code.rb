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
  end
  def cells
    [Cell.new(0,0,0)]
  end
end

