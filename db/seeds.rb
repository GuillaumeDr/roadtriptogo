# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#puts "Creating 3 projects..."

#Project.destroy_all

#Project.create!(name: "Week-end à Rome", description: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maiores vitae aliquid voluptates a. Fugiat eaque earum optio tempora repudiandae.", theme: "culture", profil: "confortable", season: "automne", transport: "avion", total_budget: "500")

#puts "end"

puts "creating todolist..."
Todolist.create!(project_id: "31")
puts "end"

puts "creating tasks..."
Task.create!(description: "passeport", status: false, todolist_id: 1)
Task.create!(description: "carte d'embarquement", status: false, todolist_id: 1)
Task.create!(description: "carte d'identité", status: false, todolist_id: 1)
Task.create!(description: "check-in", status: false, todolist_id: 1)
puts "end"

Event.destroy_all
Event.create!(event_type: "Logements", name: "Ibis hotel", address: "1 avenue de Longchamps", duration: "soir", description: "super hotel", price: 30, date: "2022-06-05", step_id: 1)
Event.create!(event_type: "Restaurants", name: "Le Sésame", address: "3 rue de Calais", duration: "soir", description: "très bon risotto", price: 23, date: "2022-06-05", step_id: 1)
Event.create!(event_type: "Activités", name: "Rafting", address: "Près de la mairie", duration: "Après-midi", description: "prendre serviette", price: 12, date: "2022-06-05", step_id: 1)
Event.create!(event_type: "Notes", description: "Jour de marché !", date: "2022-06-05", step_id: 1)
Event.create!(event_type: "Logements", name: "Novotel", address: "1 avenue de Longchamps", duration: "soir", description: "super hotel", price: 30, date: "2022-06-06", step_id: 1)
Event.create!(event_type: "Restaurants", name: "Macdonald", address: "3 rue de Calais", duration: "soir", description: "très bon risotto", price: 23, date: "2022-06-06", step_id: 1)
Event.create!(event_type: "Activités", name: "Acrobranche", address: "Près de la mairie", duration: "Après-midi", description: "prendre serviette", price: 12, date: "2022-06-06", step_id: 1)
Event.create!(event_type: "Notes", description: "Déposer les enfants chez les grand-parents", date: "2022-06-06", step_id: 1)
