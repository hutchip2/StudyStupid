require 'spec_helper'

describe "decks/index" do
  before(:each) do
    assign(:decks, [
      stub_model(Deck),
      stub_model(Deck)
    ])
  end

  it "renders a list of decks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
