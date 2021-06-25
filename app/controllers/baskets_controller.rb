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
    @shared_basket_meals = @basket.basket_meals.filter(&:shared?)
    @not_shared_basket_meals = @basket.basket_meals.reject(&:shared?)
    @total_price = 0
    session = stripe_session
    @basket.update(checkout_session_id: session.id)
  end

  def payment_confirmation
    @basket = Basket.find(params[:id])
  end

  def pending_payment
    @basket = Basket.find(params[:id])
  end

  private

  def stripe_session
    @items = @basket.basket_meals.map do |basket_meal|
      basket_meal.to_stripe_hash
    end.flatten

    Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: @items,
      success_url: pending_payment_basket_url(@basket),
      cancel_url: basket_url(@basket)
    )
  end

  def basket_params
    params.require(:basket).permit(:status)
  end

end
