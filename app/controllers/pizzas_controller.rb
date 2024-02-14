class PizzasController < ApplicationController
    def index
        @pizzas = Pizza.all
    end
    
    def show
        @pizza = Pizza.includes(:toppings).find(params[:id])
    end
    
    def new
        @pizza = Pizza.new
    end

    def edit
        @pizza = Pizza.find(params[:id])
    end

    def create
        @pizza = Pizza.new(pizza_params)
        
        if @pizza.valid?
            @pizza.save
            redirect_to pizzas_path
        else
            render 'new'
        end
    end

    def update
        @pizza = Pizza.find(params[:id])
       
        if @pizza.update(pizza_params)
          redirect_to pizzas_path
        else
          render 'edit'
        end
    end

    def destroy
        @pizza = Pizza.find(params[:id])
        @pizza.destroy
       
        redirect_to pizzas_path
    end

    private
        def pizza_params
            params.require(:pizza).permit(:name, topping_ids: [])
        end
end
