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

 def item_hash(basket_meal, basket_meal_quantity = nil)
    {
      name: basket_meal.meal.name,
      images: [helpers.cl_image_path(basket_meal.meal.photo.key)],
      amount: basket_meal.meal.price_cents,
      currency: 'eur',
      quantity: basket_meal_quantity ? basket_meal_quantity.to_i : basket_meal.quantity.to_i
    }
  end

  def stripe_session
    @items = @basket.basket_meals.map do |basket_meal|
      if basket_meal.quantity != basket_meal.quantity.to_i        # if basket_meal.quantity is a float
        # we re rounding it down
        basket_meal_quantity = basket_meal.quantity.to_i
        half_hash = {
          name: " 1/2 #{basket_meal.meal.name}",
          images: [helpers.cl_image_path(basket_meal.meal.photo.key)],
          amount: basket_meal.meal.price_cents / 2,
          currency: 'eur',
          quantity: 1
        }
        if basket_meal_quantity.zero?
          half_hash
        else
          # create exactly that hash below
          whole_hash = item_hash(basket_meal, basket_meal_quantity)
          # additionally, create a meal.name 1/2 with quantity = 1, amount = half 1 meal
          [whole_hash, half_hash]
        end
      else
        item_hash(basket_meal, basket_meal.quantity)
      end
    end.flatten

    Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: @items,
      success_url: payment_confirmation_basket_url(@basket),
      cancel_url: basket_url(@basket)
    )
  end

  def basket_params
    params.require(:basket).permit(:status)
  end
end


