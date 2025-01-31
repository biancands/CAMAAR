require "test_helper"

class ResultadosControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get resultados_show_url
    assert_response :success
  end
end
