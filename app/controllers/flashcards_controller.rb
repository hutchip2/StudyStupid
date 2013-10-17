class FlashcardsController < InheritedResources::Base

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
