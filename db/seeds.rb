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
Meal.create!(name: "Chicken Chaat", price: 5.80, description: "Chicken breast pieces tossed in a mixture of onions, tomatoes, cucumber, lemon juice & tangy spices", restaurant_id: Restaurant.first.id)
Meal.create!(name: "Ajwaini Salmon Tikka", price: 4.80, description: "Scottish salmon chunks marinated with garlic, herbs & spices, yoghurt, lovage seeds & cooked in tandoor", restaurant_id: Restaurant.first.id)
Meal.create!(name: "Goan Tawa Scallops", price: 7.80, description: "Pan-seared scallops flavoured with onions, tomatoes & home-made Goan spices", restaurant_id: Restaurant.first.id)
Meal.create!(name: "Chicken Tikka Bhuna", price: 5.60, description: "Boneless chicken breast marinated in mild spices, grilled in tandoor, cooked with tomatoes, onions & herbs", restaurant_id: Restaurant.first.id)
Meal.create!(name: "Chicken Jalfrezi", price: 15.20, description: "Exotic hot chicken prepared in aromatic spices with capsicum, green chillies & fresh herbs", restaurant_id: Restaurant.first.id)
Meal.create!(name: "Saag Gosht", price: 3.50, description: "Spinach cooked with tender lamb in a light sauce with fresh herbs & spices", restaurant_id: Restaurant.first.id)
Meal.create!(name: "King Prawn Saagwala", price: 6.80, description: "Spinach cooked with king prawn in a light sauce with fresh herbs & spices", restaurant_id: Restaurant.first.id)
Meal.create!(name: "Garlic Naan", price: 5.80, description: "Tandoori-baked bread made from refined leavened flour, enriched with butter & milk", restaurant_id: Restaurant.first.id)
Meal.create!(name: "Tegernseer HTB", price: 10.80, description: "Beer from Tergernsee", restaurant_id: Restaurant.first.id)
Meal.create!(name: "Coca Cola", price: 2.60, description: "Sweet fizzy drink", restaurant_id: Restaurant.first.id)
Meal.create!(name: "Fanta", price: 2.60, description: "Sweet orange fizzy drink", restaurant_id: Restaurant.first.id)

p "Creating BasketMeals..."
BasketMeal.create!(basket_id: Basket.first.id, meal_id: Meal.first.id)

p "Finished seeding"
