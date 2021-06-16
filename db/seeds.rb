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
Table.create!(number: 4, restaurant_id: Restaurant.first.id)

p "Creating Baskets..."
Basket.create!(user_id: User.first.id, table_id: Table.first.id, status: "Pending")

p "Creating Meals..."
Meal.create!(name: "Steak", price: 5.80, description: "Large piece of meat...", restaurant_id: Restaurant.first.id)
Meal.create!(name: "Pasta Bollo", price: 4.80, description: "Meat balls and spaghetti...", restaurant_id: Restaurant.first.id)
Meal.create!(name: "Shushi", price: 7.80, description: "Rolled up pieces of rice and fish...", restaurant_id: Restaurant.first.id)
Meal.create!(name: "Chicken Tikka Masala", price: 5.60, description: "Chicken in tasty soup...", restaurant_id: Restaurant.first.id)
Meal.create!(name: "Garlic Naan", price: 5.80, description: "Naan with garlic pieces...", restaurant_id: Restaurant.first.id)
Meal.create!(name: "Rosinen Brötchen", price: 15.20, description: "Bread with raisins...", restaurant_id: Restaurant.first.id)
Meal.create!(name: "Salad", price: 3.50, description: "Pieces of lettuce in a bowl...", restaurant_id: Restaurant.first.id)
Meal.create!(name: "Pizza Diavola", price: 6.80, description: "Italian bread and spicy saussage...", restaurant_id: Restaurant.first.id)
Meal.create!(name: "Bier", price: 10.80, description: "Bier...", restaurant_id: Restaurant.first.id)
Meal.create!(name: "Coca Cola", price: 2.60, description: "Sweet fizzy drink...", restaurant_id: Restaurant.first.id)
Meal.create!(name: "Fanta", price: 2.60, description: "Sweet orange fizzy drink...", restaurant_id: Restaurant.first.id)

p "Creating BasketMeals..."
BasketMeal.create!(basket_id: Basket.first.id, meal_id: Meal.first.id)

p "Finished seeding"
