require "test_helper"

class ToppingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @topping = toppings(:one)
  end

  test "should get index" do
    get toppings_url
    assert_response :success
  end

  test "should create topping" do
    assert_difference('Topping.count') do
      post toppings_url, params: { topping: { name: "New Topping" } }
    end

    assert_redirected_to toppings_url
  end
end
