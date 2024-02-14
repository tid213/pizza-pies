class Pizza < ApplicationRecord
    has_many :pizza_toppings, dependent: :destroy
    has_many :toppings, through: :pizza_toppings
    validates :name, presence: true, :uniqueness => true,
                    length: { minimum: 1 }

    validate :unique_toppings_combination, on: :create


    private
    def unique_toppings_combination
        existing_pizza = Pizza.joins(:pizza_toppings)
        .where(pizza_toppings: { topping_id: topping_ids.sort })
        .group(:id)
        .having('COUNT(pizza_toppings.topping_id) = ?', toppings.size)
        .select { |pizza| (pizza.toppings.pluck(:id).sort - topping_ids.sort).empty? }
        .first

        if existing_pizza.present?
            errors.add(:base, "A pizza with the same toppings already exists.")
        end
    end

end
