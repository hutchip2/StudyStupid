ActiveAdmin.register Flashcard do

  menu :priority => 4

  controller { with_role :admin }

  index do
    column :id
    column :front
    column :back
    column :deck
    default_actions
  end

  filter :front
  filter :back
  filter :deck

  form do |f|
    f.inputs "Flashcard Details" do
      f.input :front
      f.input :back
      f.input :deck
    end
    f.actions
  end

  controller do

      before_filter :get_decks
      def get_decks
        @decks = Deck.all
      end

    #  before_filter :get_fcs
      def get_flashcards
        @flashcards = Flashcard.find(:all, :conditions => { :deck_id => params[:deck_id] })
      end
      helper_method :get_flashcards

  end

end
  