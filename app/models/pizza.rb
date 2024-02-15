class Pizza < ApplicationRecord
    has_many :pizza_toppings, dependent: :destroy
    has_many :toppings, through: :pizza_toppings
    validates :name, presence: true, :uniqueness => true,
                    length: { minimum: 1 }

    validate :unique_toppings_combination, on: [:create, :update]


    private
    def unique_toppings_combination
        existing_pizzas = Pizza.joins(:pizza_toppings)
                           .where(pizza_toppings: { topping_id: topping_ids.sort })
                           .group(:id)
                           .having('COUNT(pizza_toppings.topping_id) = ?', toppings.size)
                           .select { |pizza| (pizza.toppings.pluck(:id).sort - topping_ids.sort).empty? }
                           .reject { |pizza| pizza.id == id } # Exclude the current pizza being edited

        if existing_pizzas.present?
            errors.add(:base, "A pizza with the same toppings already exists.")
        end
    end

end
