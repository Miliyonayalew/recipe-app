class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food
  validates :food, uniqueness: { scope: :recipe, message: "You can't add the same recipe for the same food" }
end
