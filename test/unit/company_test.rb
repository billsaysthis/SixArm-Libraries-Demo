require 'test_helper'

class CompanyTest < ActiveRecord::TestCase

  setup do
    @company = Company.make
  end
  
  should_validate_presence_of :name
  should_validate_uniqueness_of :name
  should_validate_presence_of :state
  should_validate_presence_of :city
  
  test "should not save a company with a name of less than 8 characters" do
    co = Company.new({:name => 'abcabc'})
    assert !co.save, "Saved the company with a too-short name" 
  end
  
  test "should not save a company with a state with character length other than 2" do
    co = Company.new({:state => 'abcabc'})
    assert !co.save, "Saved the company with an invalid state length" 
  end
  
end
