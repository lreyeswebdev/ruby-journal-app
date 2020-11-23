require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
  end
  
  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should get new" do
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    assert_difference('Category.count') do
      post categories_url, params: { category: { name: "test", description: "controller test" }}
    end

    assert_redirected_to categories_url
  end

  test "should show category" do 
    get show_category_url(@category)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_url(@category)
    assert_response :success
  end

  test "should update category" do
    put update_category_url(@category), params: { category: { name: "update", description: "controller test on update"}}
    assert_redirected_to categories_url
  end

  test "should destroy journal" do
    assert_difference('Category.count', -1) do
      delete delete_category_url(@category)
    end

    assert_redirected_to categories_url
  end

end