require "minitest/autorun"

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
        @cell.x.must_equal 2
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
      context "cell with neighbors less than 2" do
        it "dies" do
          NaturalSelection.evolution(cell, naighbors).must_equal true
        end
      end
    end
  end
end
