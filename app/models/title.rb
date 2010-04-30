class Title < ActiveRecord::Base
  has_many :people
  validates :title, :presence => true
  validates_length_of :title, :within => 3..20
  
  def to_s
    self.title
  end
end
