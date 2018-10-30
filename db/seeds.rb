# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Course.create([{ title: "Appetizer" }, { title: "Breakfast" }, { title: "Dessert" }, { title: "Drink" }, { title: "Main course" }, { title: "Sauce" }])

Cuisine.create([{ title: "Brazilian" }, { title: "Cameroonian" }, { title: "Cuban" }, { title: "French" }, { title: "Fusion" }, { title: "Greek" }, { title: "Indian" }, { title: "Irish" }, { title: "Italian" }, { title: "Moroccan" }, { title: "Spanish" }, { title: "Syrian" }, { title: "Thai" }, { title: "USA" }])

Unit.create([{ title: "teaspoon" }, { title: "tablespoon" }, { title: "cup" }, { title: "clove" }, { title: "head" }, { title: "slice" }, { title: "ml" }, { title: "cl" }, { title: "dl" }, { title: "l" }, { title: "g" }, { title: "mg" }, { title: "kg" }])
