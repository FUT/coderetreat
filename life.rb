require 'rspec'

RSpec.describe "LIFE" do
  describe Cell do
    context "alive" do
      let(:cell) { Cell.new(true) }

      it "should have #state" do
        expect(cell.state).to eq(true)
      end


    end
  end
end
