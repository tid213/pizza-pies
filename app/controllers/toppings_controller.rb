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
        begin
            @topping.destroy
            redirect_to toppings_path, notice: 'Topping was successfully deleted.'
        rescue ActiveRecord::InvalidForeignKey => e
            # Handle the error gracefully
            flash.now[:alert] = 'Cannot delete the topping as it is associated with active pizzas.'
            set_toppings
            render :index, status: 422
        end
    end

    private
        def set_toppings
            @toppings = Topping.all
        end
        def set_topping
            @topping = Topping.find(params[:id])
        end
        def topping_params
            params.require(:topping).permit(:name)
        end
end
