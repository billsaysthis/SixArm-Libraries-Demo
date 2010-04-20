require 'test_helper'

class DepartmentTest < ActiveRecord::TestCase

  setup do
    @department = Department.make
  end
  
  should_validate_presence_of :name
  should_validate_uniqueness_of :name
  
end
