require "test_helper"

class AvaliacoesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get avaliacoes_show_url
    assert_response :success
  end
end
