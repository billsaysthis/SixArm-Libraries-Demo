require 'test_helper'

class TitleTest < ActiveRecord::TestCase

  setup do
    @title = Title.make
  end
  
  should_validate_presence_of :title
  should_validate_uniqueness_of :title
  
  # test "should not save a title with a title less than 3 characters long" do
  #   t = Title.new({:title => 'ab'})
  #   assert !t.save, "Saved the title with a title less than 3 characters long" 
  # end
  # 
  # test "should not save a title with a title more than 20 characters long" do
  #   t = Title.new({:title => 'abcdeabcdeabcdeabcdeabcde'})
  #   assert !t.save, "Saved the title with a title more than 20 characters long" 
  # end
  
end
