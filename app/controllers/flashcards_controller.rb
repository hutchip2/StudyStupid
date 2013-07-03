class FlashcardsController < InheritedResources::Base

  before_filter :get_decks

  def get_decks
    @decks = Deck.all
  end

end
