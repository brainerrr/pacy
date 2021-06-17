class BasketMealsController < ApplicationController
  def create
    @meal = Meal.find(params[:meal_id])
    @basket = Basket.find(params[:basket_id])
    if @basket.meals.include?(@meal)
      # find basket_meal where meal_id is @meal.id and basket_id is @basket.id
      # update quantity of basket meal
      @basket_meal = BasketMeal.find_by(meal_id: @meal.id, basket_id: @basket.id)
      @basket_meal.quantity += 1
      @basket_meal.save
    else
      @basket_meal = BasketMeal.new
      @basket_meal.meal = @meal
      @basket_meal.basket = @basket
      @basket_meal.save
    end
    redirect_to restaurant_meals_path(@meal.restaurant, table_id: @basket.table ), notice: "Item added"
  end

  private

  def basket_meal_params
    # params.require(:basket_meals).permit(:)
  end
end
