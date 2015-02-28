require 'rspec'

class Cell
  attr_accessor :state, :next_state

  def initialize(state)
    @state = state
  end

  def reborn!
    @state = @next_state
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
      end
    end
  end

  describe World do
    let(:world) { World.new("   **\n     \n*****\n*   **") }

    it "should be Array" do
      expect(world).to be_an(Array)
    end

    it "should contain cells" do
      expect(world.cells.first).to be_an(Cell)
    end
  end
end
