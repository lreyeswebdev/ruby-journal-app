require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @task = tasks(:default)
    @category = categories(:two)
    get '/users/sign_in'
    sign_in users(:one)
    post new_user_session_url
  end

  test "should get index" do
    get category_tasks_url(@category, @task)
    assert_response :success
  end

  test "should get new task" do
    get new_category_task_url(@category, @task)
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post category_tasks_url(@category, @task), params: { task: { name: "test", details: "controller test" }}
    end

    assert_redirected_to category_tasks_url
  end

  test "should show task" do 
    get category_tasks_url(@category, @task)
    assert_response :success
  end

  test "should get edit task" do
    get edit_category_task_url(@task.category_id, @task.id)
    assert_response :success
  end

  test "should update task" do
    put category_task_url(@task.category_id, @task.id), params: { task: { name: "update", details: "controller test on update" }}

    assert_redirected_to category_tasks_url
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete category_task_url(@task.category_id, @task.id)
    end

    assert_redirected_to category_tasks_url
  end

end
