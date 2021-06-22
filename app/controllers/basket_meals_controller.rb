class BasketMealsController < ApplicationController
  def create
    @meal = Meal.find(params[:basket_meal][:meal_id])
    @basket = Basket.find(params[:basket_id])
    if @basket.meals.include?(@meal)
      # find basket_meal where meal_id is @meal.id and basket_id is @basket.id
      # update quantity of basket meal
      @basket_meal = BasketMeal.find_by(meal_id: @meal.id, basket_id: @basket.id)
      @basket_meal.quantity += params[:basket_meal][:quantity].to_i
      @basket_meal.save
    else
      @basket_meal = BasketMeal.new(basket_meal_params)
      @basket_meal.basket = @basket
      @basket_meal.save
    end
    redirect_to restaurant_meals_path(@meal.restaurant, table_id: @basket.table)
  end

  def destroy
    @basket_meal = BasketMeal.find(params[:id])
    @basket_meal.destroy
    redirect_to basket_path(@basket_meal.basket)
  end

  def update
    @basket_meal = BasketMeal.find(params[:id])
    @basket_meal.quantity = @basket_meal.quantity - 1
    @basket_meal.save
    redirect_to basket_path(@basket_meal.basket)
  end

  private

  def basket_meal_params
    params.require(:basket_meal).permit(:meal_id, :quantity)
  end
end
