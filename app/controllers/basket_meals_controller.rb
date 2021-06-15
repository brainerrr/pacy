class BasketMealsController < ApplicationController
  def create
    raise
    @basket_meal = BasketMeal.new(basket_meal_params)
  end

  private

  def basket_meal_params
    # params.require(:basket_meals).permit(:)
  end
end
