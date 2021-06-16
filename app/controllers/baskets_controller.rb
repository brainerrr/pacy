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

  def show
    @basket = Basket.find(params[:id])
  end

  def payment_confirmation
  end

  private

  def basket_params
    params.require(:basket).permit(:status)
  end
end
