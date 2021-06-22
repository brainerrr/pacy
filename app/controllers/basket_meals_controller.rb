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
    raise
    if
      @basket_meal = BasketMeal.find(params[:id])
      @basket_meal.quantity = @basket_meal.quantity - 1
      @basket_meal.save
      redirect_to basket_path(@basket_meal.basket)
    else

    end
  end

  def edit
    @users = []

    @basket_meal = BasketMeal.find(params[:id])
    @user_baskets = Basket.where(user_id: User.all, table_id: Table.first)
    @user_baskets.each do |user_basket|
      @users << user_basket.user.last_name
    end

    # show the user all other members' last_name and/or first_name on the table
    # let the user pick one
    # for that chosen member create a basket_meal with quantity 0.5
    # update own basket_meal quantity to 0.5
  end

  private

  def basket_meal_params
    params.require(:basket_meal).permit(:meal_id, :quantity)
  end
end
