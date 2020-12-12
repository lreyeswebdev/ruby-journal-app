require 'test_helper'

class CategoriesIntegrationTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
        @category = categories(:one)
        get '/users/sign_in'
        sign_in users(:one)
        post new_user_session_url

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