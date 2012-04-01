class Entry
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Search

  field :title
  field :body

  field :permalink

  index :permalink, :unique => true

  validates :title, :presence => true
  validates :title, :length => { :in => 0..25 }

  validates :body, :presence => true
  validates :body, :length => { :minimum => 50 }

  validates :permalink, :uniqueness => true

  search_in :title, :body

  belongs_to :user

  before_validation :to_permalink

  def to_permalink
    self.permalink = self.title.gsub('/([[:punct:]]|\s)/', '-')
  end

  class << self
    def find_by_permalink(permalink)
      where(:permalink => permalink).try(:first)
    end
  end
end
