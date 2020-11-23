require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  
  def setup
    @category = Category.create(name: "Example")
  end

  test "should not save category without name" do
    category = Category.new
    assert_not category.save
  end  

  test "name should be unique" do
    duplicate_category = @category.dup
    assert_not duplicate_category.valid?
  end

end
