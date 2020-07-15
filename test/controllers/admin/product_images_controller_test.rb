require 'test_helper'

class Admin::ProductImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admin_product_images_create_url
    assert_response :success
  end

end
