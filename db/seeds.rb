# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    officer_1 = Officer.create!(name: "Frank Castle", badge_number: 23884, under_investigation: true, created_at: "2022-07-04 04:08:24 UTC", updated_at: "2022-07-05 04:08:24 UTC")
    officer_2 = Officer.create!(name: "Rod Farva", badge_number: 22342, under_investigation: false, created_at: "2022-07-02 04:08:24 UTC", updated_at: "2022-07-03 04:08:24 UTC")
    officer_3 = Officer.create!(name: "Inspector Gadget", badge_number: 23233, under_investigation: false, created_at: "2022-07-02 04:08:24 UTC", updated_at: "2022-07-03 04:08:24 UTC")

    arrest_1 = officer_1.arrests.create!(name: "Ralph Waldo Emerson", age: 23, charge_description: "Alcohol", firearm: true, created_at:"2022-07-06 02:05:39 UTC", updated_at:"2022-07-06 02:05:39 UTC")
    arrest_2 = officer_1.arrests.create!(name: "Hamburglar", age: 25, charge_description: "Drug", firearm: false, created_at: "2022-07-06 02:05:39 UTC", updated_at:"2022-07-06 02:06:36 UTC")

    arrest_3 = officer_3.arrests.create!(name: "Joker", age: 20, charge_description: "Theft", firearm: true, created_at:"2022-07-06 02:05:39 UTC", updated_at:"2022-07-06 02:05:39 UTC")