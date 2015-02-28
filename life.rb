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

  before do
    @cell = Cell.new(x, y, state)
  end

  it 'should be successfully initialized' do
    @cell = Cell.new(x, y, state)

    @cell.x.must_equal x
    @cell.y.must_equal y
    @cell.state.must_equal state
  end

  it 'should switch states' do
    @cell.new_state = 0
    @cell.live
    @cell.state.must_equal 0
  end

end
