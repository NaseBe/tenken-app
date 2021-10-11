require 'test_helper'

class TenkensControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get tenkens_index_url
    assert_response :success
  end
end
