require "test_helper"

class PizzaTest < ActiveSupport::TestCase
  test "should not save pizza without a name" do
    pizza = Pizza.new
    assert_not pizza.save, "Saved the pizza without a name"
  end

  test "should save pizza with a name" do
    pizza = Pizza.new(name: "Margherita")
    assert pizza.save, "Failed to save the pizza with a name"
  end

end
