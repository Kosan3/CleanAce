require 'test_helper'

class Admin::EntriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_entries_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_entries_show_url
    assert_response :success
  end

end
