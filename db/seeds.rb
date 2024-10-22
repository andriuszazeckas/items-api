# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# class AddInitialProducts < ActiveRecord::Migration[7.2]
#     5.times do
#       User.create(name: "John Doe", email: 'test@gmail.com',)
#   end
# end

# class AddInitialProducts < ActiveRecord::Migration[7.2]
#   5.times do
#     Item.create(price: 10.99,
#                 brand: 'Nike',
#                 photo_url: 'not now',
#                 status: 1,
#                 user_id: 1,
#                 )
#   end
# end