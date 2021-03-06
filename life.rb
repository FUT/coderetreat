require 'minitest/spec'
require 'minitest/autorun'
require 'pry'
require_relative 'life_code.rb'

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
    @universe.cells.all? { |c| c.must_be_instance_of(Cell) }
  end

  it 'should create proper number of cells' do
    @universe.cells.size.must_equal width * height
  end

  it 'should assing coordinates to cells' do
    x = rand(0..width-1)
    y = rand(0..height-1)
    cell = @universe.cells[x + height*y]
    cell.x.must_equal x
    cell.y.must_equal y
  end

  it 'should seed cells with some initial state' do
    @universe.cells.all? { |c| c.state.must_be_kind_of(Numeric) }
  end

  it 'should have at least one live cell' do
    @universe.cells.any? { |c| c.state == 0 }
  end

  it 'should have at least one live cell' do
    @universe.cells.any? { |c| c.state == 1 }
  end

  it 'should assign neighbors for cells' do
  end

end
