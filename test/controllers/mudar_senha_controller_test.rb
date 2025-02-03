require "test_helper"

class MudarSenhaControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get mudar_senha_show_url
    assert_response :success
  end
end
