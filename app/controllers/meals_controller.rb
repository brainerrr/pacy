class MealsController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    # @meals = @restaurant.meals
    @favourites = Meal.where(category: "Main").take(3)
    @starters = Meal.where(category: "Starter")
    @mains = Meal.where(category: "Main")
    @desserts = Meal.where(category: "Dessert")
    @beverages = Meal.where(category: "Beverages")
    @table = Table.find(params[:table_id])
    @current_basket = current_user.find_or_create_basket_for(@table)
  end
end
