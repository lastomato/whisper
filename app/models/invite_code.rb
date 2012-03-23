class InviteCode
  include Mongoid::Document

  attr_accessible :code

  field :code
  field :valid, :type => Boolean, :default => true

  belongs_to :user

  def confirm
    self.valid = !self.valid
  end
end
