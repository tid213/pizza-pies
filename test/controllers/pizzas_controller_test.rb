require "test_helper"

class PizzasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pizza = pizzas(:one)
  end

  test "should get index" do 
    get pizzas_path
    assert_response :success
  end

  test "should not allow duplicate pizzas" do
    existing_pizza = Pizza.create(name: "Duplicate Pizza")
    duplicate_pizza = Pizza.new(name: "Duplicate Pizza")

    assert_not duplicate_pizza.save, 'saved pizza with duplicate name'
  end


  test "should create new pizza" do
    assert_difference('Pizza.count') do
      post pizzas_path, params: {pizza: {name: "New Pizza"}}
    end

    assert_redirected_to pizzas_path

  end

end
