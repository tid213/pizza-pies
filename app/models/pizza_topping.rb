class PizzaTopping < ApplicationRecord
  belongs_to :pizza
  belongs_to :topping

  validates :pizza, uniqueness: { scope: :topping, message: "should have each topping only once" }
  validate :unique_combination

    private

    def unique_combination
        if PizzaTopping.where(pizza: pizza, topping: topping).count > 1
            errors.add(:base, "Cannot add duplicate pizza")
        end
    end
end
