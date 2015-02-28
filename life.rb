require 'rspec'

class Cell
  attr_reader :state

  def initialize(state)
    @state = state
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


    end
  end
end
