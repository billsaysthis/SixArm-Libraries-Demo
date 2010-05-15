class Title < ActiveRecord::Base
  has_many :people
  validates :title, :presence => true, :length => { :within => 3..20 }
  
  def to_s
    self.title
  end
end
