User.destroy_all
Restaurant.destroy_all
Table.destroy_all
Basket.destroy_all
Meal.destroy_all
BasketMeal.destroy_all

p "Creating User..."
User.create!(first_name: "John", last_name: "Cena", email: "john_cena@gmail.com", password: "password")


p "Creating Restaurant..."
Restaurant.create!(name: "Blockhouse", address: "Blockhouse Street, 4, Hamburg", category: "Indian")

p "Creating Tables..."
Table.create!(number: 1, restaurant_id: Restaurant.first.id)
Table.create!(number: 2, restaurant: Restaurant.first)
Table.create!(number: 3, restaurant_id: Restaurant.first.id)

p "Creating Baskets..."
Basket.create!(user_id: User.first.id, table_id: Table.first.id)

p "Creating Meals..."
Meal.create!(name: "Steak", price: 5.80, description: "Large piece of meat...", restaurant_id: Restaurant.first.id)

p "Creating BasketMeals..."
BasketMeal.create!(basket_id: Basket.first.id, meal_id: Meal.first.id)

p "Finished seeding"
