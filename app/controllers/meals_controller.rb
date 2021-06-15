class MealsController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @meals = @restaurant.meals
    @table = Table.find(params[:table_id])

    @current_basket = current_user.find_or_create_basket_for(@table)

  end
end
