class Account < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  ALLOWED_ROLES = ['user', 'admin']

  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  has_many :decks, :dependent => :destroy

  validates :role, :presence => true, :inclusion => { :in => ALLOWED_ROLES, :message => 'is not a valid role' }

  attr_accessible :email, :role, :password, :password_confirmation, :remember_me, :as => [:default, :admin]

  #### Instance Methods ####

  def admin?
    self.role.eql?('admin')
  end

  def user?
    self.role.eql?('user')
  end

end
