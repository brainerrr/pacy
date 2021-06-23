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
    @basket_meal.update(basket_meal_params)

    @basket_meal.save
    redirect_to basket_path(@basket_meal.basket)
  end

  def share
    @basket = Basket.find(params[:basket_id])
    @users = @basket.table.users - [current_user]
    @basket_meal = BasketMeal.new
  end

  def share_with
    @meal = Meal.find(params[:meal_id])
    @basket = Basket.find(params[:basket_id])
    @other_user = User.find(params[:user])

    @basket_meal = BasketMeal.new(quantity: 0.5, basket: @basket, meal: @meal)
    @basket_meal.save

    @other_basket = Basket.find_by(table: @basket.table, user: @other_user)

    BasketMeal.create(meal: @meal, basket: @other_basket, quantity: @basket_meal.quantity)

    redirect_to restaurant_meals_path(@meal.restaurant, table_id: @basket.table)
  end

  # def self.quantity_display
  #   if self.quantity == self.quantity.to_i
  #     self.quantity = self.quantity.to_i
  #   end
  #   return self.quantity
  # end

  private

  def basket_meal_params
    params.require(:basket_meal).permit(:meal_id, :quantity)
  end

end
