require 'spec_helper'

describe "flashcards/new" do
  before(:each) do
    assign(:flashcard, stub_model(Flashcard).as_new_record)
  end

  it "renders new flashcard form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", flashcards_path, "post" do
    end
  end
end
