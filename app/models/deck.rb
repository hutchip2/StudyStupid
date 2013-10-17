class Deck < ActiveRecord::Base

  has_many :flashcards#, :through => :account, :dependent => :destroy

  belongs_to :account, :foreign_key => :account_id

  attr_protected :account_id, :current_flashcard

end
