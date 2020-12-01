require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  
  setup do
    @task = Task.create(name: "Example")
  end

  test "should not save task without name" do
    task = Task.new
    assert_not task.save
  end

  test "should not save task without details" do
    task = @task
    assert_not task.save
  end

  test "should return true if the task is completed" do
    completed_task = tasks(:completed)

    assert completed_task.completed?
  end

  test "should return true if the task is started" do
    started_task = tasks(:started)

    assert started_task.started?
  end

end
