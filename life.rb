require 'rspec'

class Cell
  attr_accessor :state, :next_state

  def initialize(state)
    @state = state
  end

  def reborn!
    @state = @next_state
    @next_state = nil
  end
end

class World
  attr_reader :cells

  def initialize(text)
    @cells = [Cell.new(false)]
  end
end

RSpec.describe "LIFE" do
  describe Cell do
    context "alive" do
      let(:cell) { Cell.new(true) }

      it "should have #state" do
        expect(cell.state).to eq(true)
      end

      it "should have #next_state" do
        cell.next_state = false
        expect(cell.next_state).to eq(false)
      end

      it "should have #reborn!" do
        cell.next_state = false
        cell.reborn!
        expect(cell.state).to eq(false)
        expect(cell.next_state).to eq(nil)
      end
    end
  end

  describe World do
    let(:world) { World.new("   **\n     \n*****\n*   **") }

    it "should be Array" do
      expect(world).to be_an(World)
    end

    it "should contain cells" do
      expect(world.cells.first).to be_an(Cell)
    end

    it "first cell should be dead" do
      expect(world.cells.first.state).to eq(false)
    end

    it "last cell should be alive" do
      expect(world.cells.first.state).to eq(true)
    end

  end
end
