require "minitest/autorun"

class NaturalSelection
  def self.evolution(cell, neighbours)
    count = neighbours.select(&:alive?).count
    if count == 2
      cell.alive?
    elsif count == 3
      true
    else
      false
    end
  end
end

class Cell
  ALIVE = true
  DEAD = false

  attr_reader :x, :y, :state

  def initialize(x, y, state)
    @x, @y = x, y
    @state = state
  end

  def alive?
    !!state
  end

  def dead?
    !alive?
  end
end

class TestLife < Minitest::Test
  describe 'dead cell' do
    def setup
      @cell = Cell.new 1, 2, Cell::DEAD
    end

    describe '#alive?' do
      it 'should return false for alive cell' do
        @cell.alive?.must_equal false
      end
    end

    describe '#dead?' do
      it 'should return true for dead cell' do
        @cell.dead?.must_equal true
      end
    end

    describe '#x' do
      it 'should return x coordinate' do
        @cell.x.must_equal 1
      end
    end

    describe '#y' do
      it 'should return y coordinate' do
        @cell.y.must_equal 2
      end
    end
  end

  describe 'alive cell' do
    def setup
      @cell = Cell.new 3, 4, Cell::ALIVE
    end

    describe '#alive?' do
      it 'should return true for alive cell' do
        @cell.alive?.must_equal true
      end
    end

    describe '#dead?' do
      it 'should return false for alive cell' do
        @cell.dead?.must_equal false
      end
    end
  end

  describe 'NaturalSelection' do
    def setup
    end

    describe "#evolution" do
      describe "alive cell with neighbors less than 2" do
        it "dies" do
          cell = Cell.new(1,1, true)
          neighbors = [
            Cell.new(0,0, false),
            Cell.new(1,0, false),
            Cell.new(2,0, false),
            Cell.new(0,1, false),
            Cell.new(1,2, true),
            Cell.new(2,0, false),
            Cell.new(2,1, false),
            Cell.new(2,2, false)
          ]
          NaturalSelection.evolution(cell, neighbors).must_equal false
        end
      end

      describe "alive cell with more than 3 naighbors" do
        it "dies" do
          cell = Cell.new(1,1, true)
          neighbors = [
            Cell.new(0,0, true),
            Cell.new(1,0, true),
            Cell.new(2,0, true),
            Cell.new(0,1, false),
            Cell.new(1,2, true),
            Cell.new(2,0, false),
            Cell.new(2,1, false),
            Cell.new(2,2, false)
          ]
          NaturalSelection.evolution(cell, neighbors).must_equal false
        end
      end

      describe "dead cell with 3 neighbors" do
        it "comes alive" do
          cell = Cell.new(1, 1, false)
          neighbors = [
            Cell.new(0, 0, false),
            Cell.new(1, 0, false),
            Cell.new(2, 0, true),
            Cell.new(1, 0, false),
            Cell.new(1, 2, true),
            Cell.new(2, 0, false),
            Cell.new(2, 1, false),
            Cell.new(2, 2, true)
          ]
          NaturalSelection.evolution(cell, neighbors).must_equal true
        end
      end

      describe "dead cell with 3 neighbors" do
        it "comes alive" do
          cell = Cell.new(1, 1, true)
          neighbors = [
            Cell.new(0, 0, false),
            Cell.new(1, 0, false),
            Cell.new(2, 0, true),
            Cell.new(1, 0, false),
            Cell.new(1, 2, true),
            Cell.new(2, 0, false),
            Cell.new(2, 1, false),
            Cell.new(2, 2, false)
          ]
          NaturalSelection.evolution(cell, neighbors).must_equal true
        end
      end
    end
  end
end
