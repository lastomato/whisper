class User
  include Mongoid::Document
  include Mongoid::Timestamps

  attr_accessible :username, :password, :password_confirmation
  attr_accessor :password

  auto_increment :number, :seed => 0

  field :username

  field :password_hash
  field :password_salt

  validates :username, :presence => true
  validates :username, :uniqueness => true
  validates :username, :length => { :in => 5..15 }

  validates :password, :confirmation => true
  validates :password, :length => { :in => 8..20 }

  before_save :encrypt_password

  has_many :entries, :dependent => :nullify

  def self.authenticate(username, password)
    user = where(:username => username).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.find_by_number(number)
    where(:number => number).first
  end
end
