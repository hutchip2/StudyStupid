require 'spec_helper'

describe "flashcards/edit" do
  before(:each) do
    @flashcard = assign(:flashcard, stub_model(Flashcard))
  end

  it "renders the edit flashcard form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", flashcard_path(@flashcard), "post" do
    end
  end
end
