require "spec_helper"

describe FlashcardsController do
  describe "routing" do

    it "routes to #index" do
      get("/flashcards").should route_to("flashcards#index")
    end

    it "routes to #new" do
      get("/flashcards/new").should route_to("flashcards#new")
    end

    it "routes to #show" do
      get("/flashcards/1").should route_to("flashcards#show", :id => "1")
    end

    it "routes to #edit" do
      get("/flashcards/1/edit").should route_to("flashcards#edit", :id => "1")
    end

    it "routes to #create" do
      post("/flashcards").should route_to("flashcards#create")
    end

    it "routes to #update" do
      put("/flashcards/1").should route_to("flashcards#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/flashcards/1").should route_to("flashcards#destroy", :id => "1")
    end

  end
end
