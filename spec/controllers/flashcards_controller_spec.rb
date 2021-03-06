require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe FlashcardsController do

  # This should return the minimal set of attributes required to create a valid
  # Flashcard. As you add validations to Flashcard, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FlashcardsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all flashcards as @flashcards" do
      flashcard = Flashcard.create! valid_attributes
      get :index, {}, valid_session
      assigns(:flashcards).should eq([flashcard])
    end
  end

  describe "GET show" do
    it "assigns the requested flashcard as @flashcard" do
      flashcard = Flashcard.create! valid_attributes
      get :show, {:id => flashcard.to_param}, valid_session
      assigns(:flashcard).should eq(flashcard)
    end
  end

  describe "GET new" do
    it "assigns a new flashcard as @flashcard" do
      get :new, {}, valid_session
      assigns(:flashcard).should be_a_new(Flashcard)
    end
  end

  describe "GET edit" do
    it "assigns the requested flashcard as @flashcard" do
      flashcard = Flashcard.create! valid_attributes
      get :edit, {:id => flashcard.to_param}, valid_session
      assigns(:flashcard).should eq(flashcard)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Flashcard" do
        expect {
          post :create, {:flashcard => valid_attributes}, valid_session
        }.to change(Flashcard, :count).by(1)
      end

      it "assigns a newly created flashcard as @flashcard" do
        post :create, {:flashcard => valid_attributes}, valid_session
        assigns(:flashcard).should be_a(Flashcard)
        assigns(:flashcard).should be_persisted
      end

      it "redirects to the created flashcard" do
        post :create, {:flashcard => valid_attributes}, valid_session
        response.should redirect_to(Flashcard.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved flashcard as @flashcard" do
        # Trigger the behavior that occurs when invalid params are submitted
        Flashcard.any_instance.stub(:save).and_return(false)
        post :create, {:flashcard => {  }}, valid_session
        assigns(:flashcard).should be_a_new(Flashcard)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Flashcard.any_instance.stub(:save).and_return(false)
        post :create, {:flashcard => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested flashcard" do
        flashcard = Flashcard.create! valid_attributes
        # Assuming there are no other flashcards in the database, this
        # specifies that the Flashcard created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Flashcard.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => flashcard.to_param, :flashcard => { "these" => "params" }}, valid_session
      end

      it "assigns the requested flashcard as @flashcard" do
        flashcard = Flashcard.create! valid_attributes
        put :update, {:id => flashcard.to_param, :flashcard => valid_attributes}, valid_session
        assigns(:flashcard).should eq(flashcard)
      end

      it "redirects to the flashcard" do
        flashcard = Flashcard.create! valid_attributes
        put :update, {:id => flashcard.to_param, :flashcard => valid_attributes}, valid_session
        response.should redirect_to(flashcard)
      end
    end

    describe "with invalid params" do
      it "assigns the flashcard as @flashcard" do
        flashcard = Flashcard.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Flashcard.any_instance.stub(:save).and_return(false)
        put :update, {:id => flashcard.to_param, :flashcard => {  }}, valid_session
        assigns(:flashcard).should eq(flashcard)
      end

      it "re-renders the 'edit' template" do
        flashcard = Flashcard.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Flashcard.any_instance.stub(:save).and_return(false)
        put :update, {:id => flashcard.to_param, :flashcard => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested flashcard" do
      flashcard = Flashcard.create! valid_attributes
      expect {
        delete :destroy, {:id => flashcard.to_param}, valid_session
      }.to change(Flashcard, :count).by(-1)
    end

    it "redirects to the flashcards list" do
      flashcard = Flashcard.create! valid_attributes
      delete :destroy, {:id => flashcard.to_param}, valid_session
      response.should redirect_to(flashcards_url)
    end
  end

end
