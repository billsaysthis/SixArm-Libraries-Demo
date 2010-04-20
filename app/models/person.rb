# for getting password
require 'webget_ruby_password_text'

class Person < ActiveRecord::Base
  belongs_to :company
  belongs_to :department
  belongs_to :title
  
  validates_presence_of :company
  validates_associated :company
  validates_presence_of :department
  validates_associated :department
  validates_presence_of :title
  validates_associated :title
  
  validates_presence_of :last_name
  validates_presence_of :first_name
  validates_presence_of :hired_on
  validates_presence_of :salary, :minimum => 30000
  
  scope :active, where("terminated_on IS NULL")
  scope :terminated, where("terminated_on IS NOT NULL")
  
  include PersonName
  # for list_name, full_name functions

  # generate a secure password from webget_ruby_password_text
  before_create {|person| person.password = PasswordText.new(16)}
  # store a plain (unaccented) version of the fullname for search
  before_save {|person| person.plain_fullname = person.full_name.unaccent}
  
  # easy stringified version of terminated_on
  def terminated
    self.terminated_on.nil? ? '' : self.terminated_on.to_date.to_formatted_s(:db)
  end

  def short_list_name
    self.last_name + ', ' + self.first_name
  end
end
