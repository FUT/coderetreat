class Cell
  attr_reader :x, :y, :state
  attr_accessor :new_state

  def initialize(x, y, state)
    @x, @y, @state = x, y, state
  end

  def live
    @state = 0
  end
end

