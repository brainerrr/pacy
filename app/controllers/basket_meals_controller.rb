class BasketMealsController < ApplicationController
  def create
    @meal = Meal.find(params[:meal_id])
    @basket = Basket.find(params[:basket_id])

    @basket_meal = BasketMeal.new
    @basket_meal.meal = @meal
    @basket_meal.basket = @basket


    @basket_meal.save!

    redirect_to restaurant_meals_path(@meal.restaurant, table_id: @basket.table ), notice: "Item added"


  end

  private

  def basket_meal_params
    # params.require(:basket_meals).permit(:)
  end
end
