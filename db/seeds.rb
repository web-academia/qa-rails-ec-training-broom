# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.create!(product_name: "電卓",
                 category_id: 1,
                 price: 250,
                 description: "小型の電卓です",
                 sale_status_id: 1,
                 product_status_id: 1,
                 user_id: 1)
Product.create!(product_name: "ノート",
                 category_id: 1,
                 price: 150,
                 description: "A4サイズのノートです",
                 sale_status_id: 1,
                 product_status_id: 1,
                 user_id: 1)
Product.create!(product_name: "鉛筆",
                 category_id: 1,
                 price: 80,
                 description: "書きやすいです",
                 sale_status_id: 1,
                 product_status_id: 1,
                 user_id: 2)
Product.create!(product_name: "定規",
                 category_id: 1,
                 price: 100,
                 description: "30cm定規です",
                 sale_status_id: 1,
                 product_status_id: 1,
                 user_id: 2)