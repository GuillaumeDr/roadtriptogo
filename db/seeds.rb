# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating 3 projects..."

Project.destroy_all

Project.create!(name: "Week-end à Rome", description: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maiores vitae aliquid voluptates a. Fugiat eaque earum optio tempora repudiandae.", theme: "culture", profil: "confortable", season: "automne", transport: "avion", total_budget: "500")
Project.create!(name: "20 jours à Bali", description: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maiores vitae aliquid voluptates a. Fugiat eaque earum optio tempora repudiandae.", theme: "nature", profil: "backpack", season: "été", transport: "avion", total_budget: "800")
Project.create!(name: "A la découverte de la France", description: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maiores vitae aliquid voluptates a. Fugiat eaque earum optio tempora repudiandae.", theme: "gastronomy", profil: "luxe", season: "printemps", transport: "voiture", total_budget: "1500")

puts "end"
