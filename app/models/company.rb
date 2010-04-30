class Company < ActiveRecord::Base
  has_many :departments
  has_many :people
  
  validates :name, :presence => true, :uniqueness => true
  validates_length_of :name, :minimum => 8
  validates_presence_of :city
  validates_presence_of :state
  validates_length_of :state, :in => 2..2
  validates_presence_of :incorporation_year
  
  def to_s
    self.name
  end
end
