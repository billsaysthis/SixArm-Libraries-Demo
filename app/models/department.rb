class Department < ActiveRecord::Base
  belongs_to :company
  has_many :people
  has_one :manager, :class_name => "Person"
  
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :company
  validates_associated :company
  
  def to_s
    self.name
  end
end
