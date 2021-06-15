class BasketsController < ApplicationController
  def create
    @basket = Basket.new(basket_params)
    @basket.user = current_user
    if @basket.save!
      redirect_to restaurant_meals_path
    else
      raise
    end
  end

  private

  def basket_params
    params.require(:basket).permit(:status)
  end
end
