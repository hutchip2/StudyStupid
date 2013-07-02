class Flashcard < ActiveRecord::Base
  
  belongs_to :deck, :foreign_key => :deck_id
  
  attr_accessible :front, :back, :deck_id
  
end
