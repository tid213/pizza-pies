class PizzaToppingsController < ApplicationController
    def index
        @pizza_toppings = PizzaTopping.all
      end
    
      def show
      end
    
      def new
        @pizza_topping = PizzaTopping.new
      end
    
      def create
        @pizza_topping = PizzaTopping.new(pizza_topping_params)
    
        if @pizza_topping.save
          redirect_to @pizza_topping
        else
          render 'new'
        end
      end
    
      def edit
      end
    
      def update
        if @pizza_topping.update(pizza_topping_params)
          redirect_to @pizza_topping
        else
          render 'edit'
        end
      end
    
      def destroy
        @pizza_topping.destroy
        redirect_to pizza_toppings_url, notice: 'Pizza topping was successfully destroyed.'
      end
    
      private
    
      def set_pizza_topping
        @pizza_topping = PizzaTopping.find(params[:id])
      end
    
      def pizza_topping_params
        params.require(:pizza_topping).permit(:pizza_id, :topping_id)
      end
end
