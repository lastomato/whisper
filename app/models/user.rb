class User
  include Mongoid::Document

  attr_accessible :username, :email, :password, :password_confirmation
  attr_accessor :password

  field :username
  field :email

  field :password_hash
  field :password_salt

  validates :username, :presence => true
  validates :username, :uniqueness => true
  validates :username, :length => { :in => 5..15 }

  validates :email, :presence => true
  validates :email, :format => { :with => %r/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }, :on => :create
  validates :email, :uniqueness => true

  validates :password, :confirmation => true
  validates :passowrd, :length => { :in => 8..20 }

  before_save :encrypt_password
end
