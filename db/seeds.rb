# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

UserClassfication.create!(user_classfication_name: '一般ユーザー')

User.create!(
  password: 'pass1234',
  last_name: '山田',
  first_name: '太郎',
  zipcode: '1230123',
  prefecture: '東京都',
  municipality: '江東区',
  address: '辰巳1丁目1-1',
  apartments: '101',
  email: 'user01@example.com',
  phone_number: '09012345678',
  user_classfication_id: '1',
  company_name: '株式会社山田建設',
  delete_flag: true
)

User.create!(
  password: "1234word",
  last_name: "鈴木",
  first_name: "花子",
  zipcode: "4560456",
  prefecture: "神奈川県",
  municipality: "横浜市",
  address: "東神奈川2丁目2-2",
  apartments: "202",
  email: "user02@example.com",
  phone_number: "08011112222",
  user_classfication_id: "1",
  company_name: "株式会社鈴木工業",
  delete_flag: true
)

Category.create!(category_name: "文具")
Category.create!(category_name: "食品・飲料")
Category.create!(category_name: "スポーツ用品")
Category.create!(category_name: "本・雑誌・マンガ")

SaleStatus.create!(sale_status_name: "閲覧済み")
SaleStatus.create!(sale_status_name: "検討中")
SaleStatus.create!(sale_status_name: "購入手続き中")
SaleStatus.create!(sale_status_name: "購入済み")

ProductStatus.create!(product_status_name: "新品")
ProductStatus.create!(product_status_name: "中古 - 優良")
ProductStatus.create!(product_status_name: "中古 - 可")

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
Product.create!(product_name: "玉ねぎ",
                 category_id: 2,
                 price: 210,
                 description: "野菜です",
                 sale_status_id: 1,
                 product_status_id: 1,
                 user_id: 1)           
Product.create!(product_name: "食パン",
                 category_id: 2,
                 price: 150,
                 description: "６枚切りです",
                 sale_status_id: 1,
                 product_status_id: 1,
                 user_id: 2)                
Product.create!(product_name: "バット",
                 category_id: 3,
                 price: 2500,
                 description: "木製です",
                 sale_status_id: 1,
                 product_status_id: 1,
                 user_id: 1)  
Product.create!(product_name: "ボール",
                 category_id: 3,
                 price: 3000,
                 description: "サッカーボールです",
                 sale_status_id: 1,
                 product_status_id: 1,
                 user_id: 2)       
Product.create!(product_name: "Ruby入門書",
                 category_id: 4,
                 price: 2800,
                 description: "Rubyの入門書です",
                 sale_status_id: 1,
                 product_status_id: 1,
                 user_id: 1)
Product.create!(product_name: "ターゲット1900",
                 category_id: 4,
                 price: 1200,
                 description: "英単語長です",
                 sale_status_id: 1,
                 product_status_id: 1,
                 user_id: 2)                                             

Purchase.create!(product_id: 1, purchase_price: 500, purchase_quantity: 2, purchase_company: "A株式会社")
Purchase.create!(product_id: 2, purchase_price: 150, purchase_quantity: 1, purchase_company: "B株式会社")

Order.create!(user_id: 1, order_date: "2023-07-01 10:20:30", order_number: "1")
Order.create!(user_id: 2, order_date: "2023-07-02 15:25:35", order_number: "2")

ShipmentStatus.create!(shipment_status_name: "準備中")
ShipmentStatus.create!(shipment_status_name: "発送済")

OrderDetail.create!(
  product_id: 1,
  order_id: 1,
  shipment_status_id: 1,
  order_quantity: 2,
  shipment_date: "2023-07-02 12:22:32"
)

OrderDetail.create!(
  product_id: 2,
  order_id: 1,
  shipment_status_id: 1,
  order_quantity: 2,
  shipment_date: "2023-07-02 12:22:32"
)

OrderDetail.create!(
  product_id: 3,
  order_id: 1,
  shipment_status_id: 1,
  order_quantity: 2,
  shipment_date: "2023-07-02 12:22:32"
)

OrderDetail.create!(
  product_id: 4,
  order_id: 1,
  shipment_status_id: 1,
  order_quantity: 2,
  shipment_date: "2023-07-02 12:22:32"
)

OrderDetail.create!(
  product_id: 1,
  order_id: 2,
  shipment_status_id: 1,
  order_quantity: 2,
  shipment_date: "2023-07-05 18:30:45"
)

OrderDetail.create!(
  product_id: 2,
  order_id: 2,
  shipment_status_id: 2,
  order_quantity: 2,
  shipment_date: "2023-07-05 18:30:45"
)

OrderDetail.create!(
  product_id: 3,
  order_id: 2,
  shipment_status_id: 1,
  order_quantity: 2,
  shipment_date: "2023-07-05 18:30:45"
)

OrderDetail.create!(
  product_id: 4,
  order_id: 2,
  shipment_status_id: 2,
  order_quantity: 2,
  shipment_date: "2023-07-05 18:30:45"
)