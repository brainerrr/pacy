class MealsController < ApplicationController
  def index
    @meals = Meal.all
    @table_id = params[:table_id]
  end
end
