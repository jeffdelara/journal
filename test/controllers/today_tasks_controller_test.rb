require "test_helper"

class TodayTasksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get today_tasks_index_url
    assert_response :success
  end
end
