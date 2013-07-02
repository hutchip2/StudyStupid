require 'spec_helper'

describe "flashcards/show" do
  before(:each) do
    @flashcard = assign(:flashcard, stub_model(Flashcard))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
