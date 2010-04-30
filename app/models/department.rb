class Department < ActiveRecord::Base
  belongs_to :company
  has_many :people
  has_one :manager, :class_name => "Person"
  
  validates :name, :presence => true, :uniqueness => true
  validates :company, :presence => true, :associated => true
  
  def to_s
    self.name
  end
end
