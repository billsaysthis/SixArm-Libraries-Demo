require 'test_helper'

class PersonTest < ActiveRecord::TestCase

  should_validate_presence_of :first_name
  should_validate_presence_of :last_name
  should_validate_presence_of :hire_date
  should_validate_presence_of :salary
  should_validate_numericality_of :salary
  
  test "should not save a person without a salary of at least 30000 ($30,000)" do
    p = Person.new({:salary => 12000})
    assert !p.save, "Saved the person without a salary of at least 30000" 
  end
  
  should_belong_to :title
  should_belong_to :company
  should_belong_to :department
  
end
