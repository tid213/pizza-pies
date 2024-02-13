require "test_helper"

class ToppingTest < ActiveSupport::TestCase
  test "should not save topping without a name" do
    topping = Topping.new
    assert_not topping.save, "Saved the topping without a name"
  end

  test "should save topping with a name" do
    topping = Topping.new(name: "Mushrooms")
    assert topping.save, "Failed to save the topping with a name"
  end
end
