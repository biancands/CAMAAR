require "test_helper"

class EnviarFormsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get enviar_forms_show_url
    assert_response :success
  end
end
