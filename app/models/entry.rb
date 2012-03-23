class Entry
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :body

  validates :title, :presence => true
  validates :title, :length => { :in => 0..25 }

  validates :body, :presence => true
  validates :body, :length => { :minimum => 50 }

  belongs_to :user
end
