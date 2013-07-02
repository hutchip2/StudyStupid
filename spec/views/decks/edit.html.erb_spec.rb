require 'spec_helper'

describe "decks/edit" do
  before(:each) do
    @deck = assign(:deck, stub_model(Deck))
  end

  it "renders the edit deck form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", deck_path(@deck), "post" do
    end
  end
end
