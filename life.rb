require 'minitest/spec'
require 'minitest/autorun'

class Cell
  attr_reader :x, :y, :state
  def initialize(x, y, state)
    @x, @y, @state = x, y, state
  end
end

describe Cell do
  let(:x) { 3 }
  let(:y) { 3 }
  let(:state) { 1 }

  it 'should be successfully initialized' do
    c = Cell.new(x, y, state)

    c.x.must_equal x
    c.y.must_equal y
    c.state.must_equal state
  end

end
