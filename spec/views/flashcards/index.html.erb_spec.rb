require 'spec_helper'

describe "flashcards/index" do
  before(:each) do
    assign(:flashcards, [
      stub_model(Flashcard),
      stub_model(Flashcard)
    ])
  end

  it "renders a list of flashcards" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
