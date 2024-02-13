class ToppingsController < ApplicationController
    def index
        @toppings = Topping.all
    end
    
    def show
        @topping = Topping.find(params[:id])
    end
    
    def new
        @topping = Topping.new
    end

    def edit
        @topping = Topping.find(params[:id])
    end
   
    def create
        @topping = Topping.new(topping_params)
 
        if @topping.save
            redirect_to @topping
          else
            render 'new'
        end
    end

    def update
        @topping = Topping.find(params[:id])
       
        if @topping.update(topping_params)
          redirect_to @topping
        else
          render 'edit'
        end
    end

    def destroy
        @topping = Topping.find(params[:id])
        @topping.destroy
       
        redirect_to toppings_path
    end

    private
        def set_topping
            @topping = Topping.find(params[:id])
        end
        def topping_params
            params.require(:topping).permit(:name)
        end
end
