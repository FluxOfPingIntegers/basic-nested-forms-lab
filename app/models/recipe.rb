class Recipe < ActiveRecord::Base
  has_many :ingredients
  accepts_nested_attributes_for :ingredients

  def ingredients_attributes=(ingredients)
    ingredients.each_value do |ingredient|
      new_ingredient = Ingredient.create(ingredient)
      self.ingredients << new_ingredient
      self.save
    end
  end

end
