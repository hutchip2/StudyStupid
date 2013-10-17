class Flashcard < ActiveRecord::Base
  
  belongs_to :deck, :foreign_key => :deck_id
  belongs_to :account
  #has_one :account, :through => :decks
  attr_protected :front, :back, :deck_id
  
end
