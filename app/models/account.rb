class Account < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  ALLOWED_ROLES = ['user', 'admin']

  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  has_many :decks, :dependent => :destroy
  has_many :flashcards, :through => :decks

  validates :role, :presence => true, :inclusion => { :in => ALLOWED_ROLES, :message => 'is not a valid role' }

  attr_accessible :current_deck_id, :first_name, :last_name, :email, :role, :password, :password_confirmation, :remember_me, :as => [:default, :admin]

  #### Instance Methods ####

  def admin?
    self.role.eql?('admin')
  end

  def user?
    self.role.eql?('user')
  end

  def get_current_deck
    self.current_deck
  end
  
  def set_current_deck
    
  end

end
