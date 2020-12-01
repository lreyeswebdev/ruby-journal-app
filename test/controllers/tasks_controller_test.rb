require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest

  setup do
    @task = tasks(:default)
  end

  test "should get index" do
    get tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_task_url
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post tasks_url, params: { task: { name: "test", details: "controller test" }}
    end

    assert_redirected_to tasks_url
  end

  test "should show task" do 
    get show_task_url(@task)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_url(@task)
    assert_response :success
  end

  test "should update task" do
    put update_task_url(@task), params: { task: { name: "update", details: "controller test on update"}}
    assert_redirected_to tasks_url
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete delete_task_url(@task)
    end

    assert_redirected_to tasks_url
  end

end
