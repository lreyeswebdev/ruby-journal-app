require 'test_helper'

class CategoriesIntegrationTest < ActionDispatch::IntegrationTest
    setup do
        @category = categories(:one)
    end

    test 'should go to new category and create category' do
        get new_category_path
        assert_response :success

        assert_difference 'Category.count', 1 do
            post categories_path, params: { category: {name: "create test", description: "integration test" }}
            assert_response :redirect
        end

        follow_redirect!
        assert_response :success

    end

    test 'should go to edit category and update category' do
        get edit_category_url(@category)
        assert_response :success

        put category_url(@category), params: { category: { name: "update test", description: "integration test on update"}}
        assert_response :redirect

        follow_redirect!
        assert_response :success
    end

end