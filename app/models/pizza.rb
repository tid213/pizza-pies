class Pizza < ApplicationRecord
    has_many :pizza_toppings
    has_many :toppings, through: :pizza_toppings
    validates :name, presence: true, :uniqueness => true,
                    length: { minimum: 1 }

    validate :unique_toppings_combination

    private
    def unique_toppings_combination
        existing_pizza = Pizza.joins(:toppings).where(toppings: { id: self.topping_ids }).where.not(id: self.id).first
    
        if existing_pizza
          errors.add(:base, "Another pizza with the same toppings already exists.")
        end
    end
end
