class Deck < ActiveRecord::Base

  has_many :flashcards, :dependent => :destroy

  belongs_to :account, :foreign_key => :account_id

  attr_accessible :title

end
