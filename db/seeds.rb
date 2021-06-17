require "open-uri"

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

chaat_pic = URI.open("https://nishkitchen.com/wp-content/uploads/2017/10/Chicken-chaat-1B.jpg")
chaat = Meal.create!(name: "Chicken Chaat", price: 580, description: "Chicken breast pieces tossed in a mixture of onions, tomatoes, cucumber, lemon juice & tangy spices", restaurant_id: Restaurant.first.id)
chaat.photo.attach(io: chaat_pic, filename: 'nes.png', content_type: 'image/png')
chaat.save

salmon_pic = URI.open("https://www.rachaelraymag.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTYxOTQ5Njk0Mjk2MjA0NTkw/indian-spiced-salmon-and-rice-888e854d.jpg")
salmon = Meal.create!(name: "Ajwaini Salmon Tikka", price: 480, description: "Scottish salmon chunks marinated with garlic, herbs & spices, yoghurt, lovage seeds & cooked in tandoor", restaurant_id: Restaurant.first.id)
salmon.photo.attach(io: salmon_pic, filename: 'nes.png', content_type: 'image/png')
salmon.save

scallops_pic = URI.open("https://www.deliciousmagazine.co.uk/wp-content/uploads/2019/07/scallops-768x960.jpg")
scallops = Meal.create!(name: "Goan Tawa Scallops", price: 780, description: "Pan-seared scallops flavoured with onions, tomatoes & home-made Goan spices", restaurant_id: Restaurant.first.id)
scallops.photo.attach(io: scallops_pic, filename: 'nes.png', content_type: 'image/png')
scallops.save

tikka_pic = URI.open("https://www.recipetineats.com/wp-content/uploads/2018/04/Chicken-Tikka-Masala_0-SQ.jpg")
tikka = Meal.create!(name: "Chicken Tikka Bhuna", price: 560, description: "Boneless chicken breast marinated in mild spices, grilled in tandoor, cooked with tomatoes, onions & herbs", restaurant_id: Restaurant.first.id)
tikka.photo.attach(io: tikka_pic, filename: 'nes.png', content_type: 'image/png')
tikka.save

jalfrezi_pic = URI.open("https://asset.slimmingworld.co.uk/content/media/12654/chicken-jalfrezi-sept20_sw_recipe.jpg?v1=JGXiore20qg9NNIj0tmc3TKfKw-jr0s127JqqpCA2x7sMviNgcAYh1epuS_Lqxebn9V_qusKHfwbF7MOUrAPptzBhXIUL1Xnq2Mmdvx4fOk&width=640&height=640")
jalfrezi = Meal.create!(name: "Chicken Jalfrezi", price: 1520, description: "Exotic hot chicken prepared in aromatic spices with capsicum, green chillies & fresh herbs", restaurant_id: Restaurant.first.id)
jalfrezi.photo.attach(io: jalfrezi_pic, filename: 'nes.png', content_type: 'image/png')
jalfrezi.save

saag_pic = URI.open("https://www.cubesnjuliennes.com/wp-content/uploads/2015/08/DS2_8666-opt670.jpg")
saag = Meal.create!(name: "Saag Gosht", price: 350, description: "Spinach cooked with tender lamb in a light sauce with fresh herbs & spices", restaurant_id: Restaurant.first.id)
saag.photo.attach(io: saag_pic, filename: 'nes.png', content_type: 'image/png')
saag.save

saagwala_pic = URI.open("https://i.pinimg.com/originals/37/41/71/374171540c18aa5ca4a4bfa802d58666.jpg")
saagwala = Meal.create!(name: "King Prawn Saagwala", price: 680, description: "Spinach cooked with king prawn in a light sauce with fresh herbs & spices", restaurant_id: Restaurant.first.id)
saagwala.photo.attach(io: saagwala_pic, filename: 'nes.png', content_type: 'image/png')
saagwala.save

garlic_pic = URI.open("https://www.kitchensanctuary.com/wp-content/uploads/2021/03/Garlic-Naan-square-FS-42.jpg")
garlic = Meal.create!(name: "Garlic Naan", price: 580, description: "Tandoori-baked bread made from refined leavened flour, enriched with butter & milk", restaurant_id: Restaurant.first.id)
garlic.photo.attach(io: garlic_pic, filename: 'nes.png', content_type: 'image/png')
garlic.save

tegern_pic = URI.open("https://cdn02.plentymarkets.com/99cbvkn2wswt/item/images/434/full/Tegernseer-Hell.jpg")
tegern = Meal.create!(name: "Tegernseer HTB", price: 1080, description: "Beer from Tergernsee", restaurant_id: Restaurant.first.id)
tegern.photo.attach(io: tegern_pic, filename: 'nes.png', content_type: 'image/png')
tegern.save

cola_pic = URI.open("https://www.myamericanmarket.com/873-large_default/coca-cola-classic.jpg")
cola = Meal.create!(name: "Coca Cola", price: 260, description: "Sweet fizzy drink", restaurant_id: Restaurant.first.id)
cola.photo.attach(io: cola_pic, filename: 'nes.png', content_type: 'image/png')
cola.save

fanta_pic = URI.open("https://germanfoods.eu/media/image/product/2027/lg/fanta-orange-can-034.jpg")
fanta = Meal.create!(name: "Fanta", price: 260, description: "Sweet orange fizzy drink", restaurant_id: Restaurant.first.id)
fanta.photo.attach(io: fanta_pic, filename: 'nes.png', content_type: 'image/png')
fanta.save

p "Creating BasketMeals..."
BasketMeal.create!(basket_id: Basket.first.id, meal_id: Meal.first.id)

p "Finished seeding"
