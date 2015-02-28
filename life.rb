require 'minitest/spec'
require 'minitest/autorun'

class Cell
  attr_reader :x, :y, :state
  attr_accessor :new_state

  def initialize(x, y, state)
    @x, @y, @state = x, y, state
  end

  def live
    @new_state = 0
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

  it 'should switch state 0 to 1' do
    @cell.new_state = 0
    @cell.live
    @cell.state.must_equal 0
  end

  it 'should switch state 1 to 0' do
    @cell.new_state = 1
    @cell.live
    @cell.state.must_equal 1
  end

end

describe Universe do
  let(:width) { 3 }
  let(:height) { 3 }

  before do
    @universe = Universe.new(width, height)
  end

  it 'should create array of cells' do
    @universe.cells.all? { |c| c.must_be_instance_of(c) }
  end

end
