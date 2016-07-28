require 'test_helper'

class SampleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sample_index_url
    assert_response :success
  end

  test "should get new" do
    get sample_new_url
    assert_response :success
  end

  test "should get create" do
    get sample_create_url
    assert_response :success
  end

  test "should get destroy" do
    get sample_destroy_url
    assert_response :success
  end

end
